defmodule MCWeb.DemoLive do
  use MCWeb, :live_view

  def render(assigns) do
    ~H"""
    <div>Hey!</div>
    <.live_component module={MCWeb.CalculatorLive} id="calculator" />
    """
  end
end
