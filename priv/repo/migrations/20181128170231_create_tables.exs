defmodule InputsForExample.Repo.Migrations.CreateTables do
  use Ecto.Migration

  def change do
    create table("parent") do
      timestamps()
    end

    create table("child") do
      add :name, :string
      timestamps()
    end

    create table("intermediate") do
      add :child_id, references("child"), null: false
      add :parent_id, references("parent"), null: false
      timestamps()
    end

    create unique_index("intermediate", [:child_id, :parent_id])
  end
end
