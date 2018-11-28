defmodule InputsForExampleWeb.ParentController do
  use InputsForExampleWeb, :controller

  def index(conn, _params) do
    redirect(conn, to: Routes.parent_path(conn, :edit, "1"))
  end

  def edit(conn, %{"id" => id}) do
    with %{} = parent <- InputsForExample.Example.get_parent(id) do
      changeset = InputsForExample.Example.change_parent(parent)

      unassigned =
        InputsForExample.Example.unassigned_children()
        |> Enum.map(fn child ->
          %InputsForExample.Example.Intermediate{child_id: child.id, child: child}
        end)

      render(conn, "edit.html", changeset: changeset, parent: parent, unassigned: unassigned)
    end
  end

  def update(conn, %{"id" => id, "parent" => params}) do
    %{} = parent = InputsForExample.Example.get_parent(id)

    with {:ok, parent} <- InputsForExample.Example.update_parent(parent, params) do
      conn
      |> put_flash(:success, "Success")
      |> redirect(to: Routes.parent_path(conn, :edit, parent))
    else
      {:error, changeset} ->
        unassigned = InputsForExample.Example.unassigned_children()

        conn
        |> put_flash(:error, "Error")
        |> render("edit.html", changeset: changeset, parent: parent, unassigned: unassigned)
    end
  end
end
