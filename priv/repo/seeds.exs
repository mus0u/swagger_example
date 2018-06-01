# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     SwaggerExample.Repo.insert!(SwaggerExample.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias SwaggerExample.Repo
alias SwaggerExample.Generic.TreeNode

defmodule Seeds do
  def insert_unless_present!(node_name, parent \\ nil) do
    if node = Repo.get_by(TreeNode, name: node_name) do
      node
    else
      Repo.insert!(%TreeNode{name: node_name, parent: parent}, returning: true)
    end
  end
end

parent_node = Seeds.insert_unless_present!("parent node")
Seeds.insert_unless_present!("child node 1", parent_node)
Seeds.insert_unless_present!("child node 2", parent_node)
