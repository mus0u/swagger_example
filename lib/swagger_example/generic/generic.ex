defmodule SwaggerExample.Generic do
  @moduledoc """
  The Generic context.
  """

  import Ecto.Query
  alias SwaggerExample.Repo

  alias SwaggerExample.Generic.TreeNode

  @doc """
  Returns the list of tree_nodes.

  ## Examples

      iex> list_tree_nodes()
      [%TreeNode{}, ...]

  """
  def list_tree_nodes() do
    from(
      c in TreeNode,
      preload: [:parent]
      # where: not is_nil(c.parent_id) # add this to see test pass
    )
    |> Repo.all()
  end
end
