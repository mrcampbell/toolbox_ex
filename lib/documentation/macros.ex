defmodule Documentation.Macros do

  def block(type, title, content) do
      """
      > #### #{title} {: .#{type}}
      >
      > #{content}
      """
  end

  def tabs(content) when is_map(content) do
      """
      <!-- tabs-open -->
        #{for {title, body} <- content do
          """

          ### #{title}

          #{body}
          """
      end}
      <!-- tabs-close -->
      """
  end
end
