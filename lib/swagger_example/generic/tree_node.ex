defmodule SwaggerExample.Generic.TreeNode do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: false}
  @foreign_key_type :binary_id
  schema "tree_nodes" do
    field(:name, :string)
    belongs_to(:parent, __MODULE__, foreign_key: :parent_id)
    timestamps()
  end

  @required_fields [:name]
  @optional_fields [:parent_id]

  @all_fields List.flatten([@required_fields | @optional_fields])

  @doc false
  def changeset(tree_node, attrs) do
    tree_node
    |> cast(attrs, @all_fields)
    |> validate_required(@required_fields)
    |> validate_length(:name, max: 200)
    |> foreign_key_constraint(:parent_id)
    |> unique_constraint(:name, name: :tree_nodes_name_parent_id_index)
    |> unique_constraint(:name, name: :tree_nodes_name_index)
  end
end
