defmodule Documentation do
  @moduledoc """
  This is a showcase of the ExDoc documentation tool for reference for other pages.

  # Blocks

  > #### An Error Block {: .error}
  >
  > This syntax will render an error block

  > #### A Neutral Block {: .neutral}
  >
  > This syntax will render an neutral block

  > #### A Tip Block {: .tip}
  >
  > This syntax will render an tip block

  > #### A Info Block {: .info}
  >
  > This syntax will render an neutral block

  > ### With Big Header {: .info}
  >
  > Just look at the size of it

  > ###### With teeny Header
  >
  > Or a chill block, as it's not in your face, it's just good to know

  # Tabs

  {: #app name="mike"}

  <!-- tabs-open -->

  ### Elixir

  ```elixir
  IO.puts "Hello, world!"
  ```

  ### Erlang

  ```erlang
  io:fwrite("hello, world!\n").
  ```

  <!-- tabs-close -->
  """
end
