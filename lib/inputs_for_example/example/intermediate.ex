defmodule InputsForExample.Example.Intermediate do
  use Ecto.Schema
  import Ecto.Changeset
  alias InputsForExample.Example.{Parent, Child}

  schema "intermediate" do
    field :active, :boolean, virtual: true

    belongs_to :parent, Parent
    belongs_to :child, Child
    timestamps()
  end

  def changeset(struct, params) do
    struct
    |> cast(params, [:active, :child_id])
    |> delete_when_inactive()
  end

  defp delete_when_inactive(changeset) do
    case {get_field(changeset, :active), get_field(changeset, :id)} do
      {true, nil} -> changeset
      {false, nil} -> %{changeset | action: :ignore}
      {false, _} -> %{changeset | action: :delete}
      {true, _} -> changeset
    end
  end
end
