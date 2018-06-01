# Swagger Example

you will need postgres installed. there is one table, `tree_nodes`, which has a
required `name` field with a maximum length of 200 characters, and an optional
`parent_id`.

the included `priv/repo/seeds.exs` file creates one parent node and two child
nodes underneath it. `mix.exs` has been configured to automatically run the
seeds during test setup.


run `mix test` to see this behavior:

```
  1) test index lists all nodes (SwaggerExampleWeb.TreeNodeControllerTest)
     test/swagger_example_web/controllers/tree_node_controller_test.exs:10
     Response JSON does not conform to swagger schema from #/definitions/TreeNodes.
     At #/data/0/relationships/parent/data: Type mismatch. Expected Object but got Null.
     {
       "included": [],
       "data": [
         {
           "type": "tree_node",
           "relationships": {
             "parent": {
               "data": null
             }
           },
           "id": "8bdc5603-4fac-48ca-9e87-02ddb9160cd3",
           "attributes": {
             "name": "parent node"
           }
         },
         {
           "type": "tree_node",
           "relationships": {
             "parent": {
               "data": {
                 "type": "tree_node",
                 "id": "8bdc5603-4fac-48ca-9e87-02ddb9160cd3"
               }
             }
           },
           "id": "490ee6f2-0b11-4cc4-a30b-8477d83c19db",
           "attributes": {
             "name": "child node 1"
           }
         },
         {
           "type": "tree_node",
           "relationships": {
             "parent": {
               "data": {
                 "type": "tree_node",
                 "id": "8bdc5603-4fac-48ca-9e87-02ddb9160cd3"
               }
             }
           },
           "id": "538b3252-b707-4dae-9985-c19dd4ddc1bc",
           "attributes": {
             "name": "child node 2"
           }
         }
       ]
     }
     code: validate_resp_schema(conn, schema, "TreeNodes")
     stacktrace:
       test/swagger_example_web/controllers/tree_node_controller_test.exs:13: (test)
```