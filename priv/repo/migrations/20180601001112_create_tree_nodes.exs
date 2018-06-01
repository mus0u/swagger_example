defmodule SwaggerExample.Repo.Migrations.CreateTreeNodes do
  use Ecto.Migration

  def change do
    execute("CREATE EXTENSION IF NOT EXISTS \"uuid-ossp\"")
    flush()

    create table(:tree_nodes, primary_key: false) do
      add(:id, :uuid, default: fragment("uuid_generate_v4()"), null: false, primary_key: true)
      add(:name, :string, size: 200, null: false)
      add(:parent_id, references(:tree_nodes, on_delete: :nothing, type: :binary_id))

      timestamps()
    end

    create(index(:tree_nodes, [:parent_id]))
    create(unique_index(:tree_nodes, [:name, :parent_id], where: "parent_id is not null"))
    create(unique_index(:tree_nodes, [:name], where: "parent_id is null"))
  end
end
