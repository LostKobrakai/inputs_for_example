defmodule InputsForExample.Example.Parent do
  use Ecto.Schema
  import Ecto.Changeset
  alias InputsForExample.Example.Intermediate

  schema "parent" do
    has_many :intermediate_children, Intermediate

    field :error, :boolean, virtual: true

    timestamps()
  end

  def changeset(struct, params) do
    struct
    |> cast(params, [])
    |> validate_required([:error])
    |> cast_assoc(:intermediate_children, required: true)
  end
end
