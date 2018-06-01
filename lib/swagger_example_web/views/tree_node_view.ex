defmodule SwaggerExampleWeb.TreeNodeView do
  use SwaggerExampleWeb, :view
  use JSONAPI.View, type: "tree_node"

  alias SwaggerExampleWeb.TreeNodeView

  def render("index.json", %{tree_nodes: tree_nodes, conn: conn}) do
    TreeNodeView.index(tree_nodes, conn, conn.params)
  end

  def fields do
    [:name]
  end

  def relationships do
    [parent: TreeNodeView]
  end
end
