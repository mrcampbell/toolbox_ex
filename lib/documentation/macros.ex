defmodule Documentation.Macros do

  def __using__(_) do
    quote do
      import Documentation.Macros

      @block block
    end
  end

  defmacro block(type, title, content) do
    quote do
      """
      > #### #{unquote title} {: .#{unquote type}}
      >
      > #{unquote content}
      """
    end
  end
end
