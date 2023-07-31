defmodule MCWeb.CalculatorLive do
  use Phoenix.LiveComponent
  alias Phoenix.LiveView.JS
  import MCWeb.CoreComponents

  @impl true
  def render(assigns) do
    ~H"""
    <div>
      <h1>Calculator</h1>
      <.form class="grid grid-cols-3 gap-2 w-80" for={@form} phx-target={@myself}>
        <%= for number <- 1..10 do %>
          <%= if number == 10 do %>
            <div>
              <!--spacer -->
            </div>
          <% end %>
          <.button
            phx-click="press"
            phx-click={JS.push("press", value: %{number: rem(number, 10)})}
            phx-target={@myself}
            type="button"
          >
            <%= if number == 10 do %>
              0
            <% else %>
              <%= number %>
            <% end %>
          </.button>
        <% end %>
      </.form>
    </div>
    """
  end

  @impl true
  def mount(socket) do
    {:ok, socket |> assign(:form, %{}) |> assign(:result, 0)}
  end

  @impl true
  def handle_event("press", %{"number" => number}, socket) do
    IO.puts(number)
    {:noreply, socket}
  end
end
