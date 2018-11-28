defmodule InputsForExample.Example do
  alias InputsForExample.Repo
  alias InputsForExample.Example.{Parent, Child, Intermediate}
  import Ecto.Query

  def get_parent(id) do
    Repo.get(Parent, id)
  end

  def change_parent(parent) do
    parent
    |> Repo.preload(intermediate_children: :child)
    |> Map.update!(:intermediate_children, fn c -> Enum.map(c, &%{&1 | active: true}) end)
    |> Ecto.Changeset.change()
  end

  def update_parent(parent, params) do
    parent
    |> Repo.preload(intermediate_children: :child)
    |> Parent.changeset(params)
    |> Repo.update()
  end

  def unassigned_children do
    Child
    |> join(:left, [c], i in Intermediate, on: i.child_id == c.id)
    |> where([_, i], is_nil(i.id))
    |> Repo.all()
  end
end
