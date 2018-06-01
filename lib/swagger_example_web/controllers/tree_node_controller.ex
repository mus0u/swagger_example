defmodule SwaggerExampleWeb.TreeNodeController do
  use SwaggerExampleWeb, :controller
  use PhoenixSwagger

  alias SwaggerExample.Generic

  swagger_path :index do
    get("/api/v1/tree_nodes")
    description("Fetches all tree nodes")
    response(200, "Success", Schema.ref(:TreeNodes))
  end

  def index(conn, _params) do
    render(conn, "index.json", tree_nodes: Generic.list_tree_nodes())
  end

  def swagger_definitions do
    %{
      TreeNode:
        JsonApi.resource do
          description("A tree node")

          attributes do
            name(:string, "The name of the node", required: true)
          end

          relationship(:parent)
        end,
      TreeNodes:
        swagger_schema do
          title("Tree Nodes")
          description("A collection of tree nodes")
          property :data, array(:TreeNode)
        end
    }
  end
end
