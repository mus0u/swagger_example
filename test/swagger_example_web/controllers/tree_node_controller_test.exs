defmodule SwaggerExampleWeb.TreeNodeControllerTest do
  use SwaggerExampleWeb.ConnCase
  use PhoenixSwagger.SchemaTest, "priv/static/swagger.json"

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/vnd.api+json")}
  end

  describe "index" do
    test "lists all nodes", %{conn: conn, swagger_schema: schema} do
      conn = get(conn, api_v1_tree_node_path(conn, :index))
      assert json_response(conn, 200)
      validate_resp_schema(conn, schema, "TreeNodes")
    end
  end
end
