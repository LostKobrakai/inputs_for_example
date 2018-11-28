defmodule InputsForExample.Example.Child do
  use Ecto.Schema

  schema "child" do
    field :name, :string

    timestamps()
  end
end
