defmodule Documentation.Test do
  import Documentation.Macros

  @moduledoc """

  # Blocks
  #{block :error, "An Error Block", "this is the body"}
  """
end
