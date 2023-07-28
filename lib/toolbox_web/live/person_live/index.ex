defmodule MCWeb.PersonLive.Index do
  use MCWeb, :live_view

  alias MC.Form
  alias MC.Form.Person

  @doc """
  Mount is called by Phoenix when the LiveView is mounted,
  and with the current params, socket, and session. params are editable
  by the user, while session is set only by the server. After mounting,
  handle_params/3 is called.

  After handle_params/3 is called, render/1 is called, sending HTML to the client,
  but then, when the LiveView is connected, mount is run again.

  mount/3 and handle_params/3 are called anytime the user disconnects and then
  reconnects to the server.
  """
  @impl true
  def mount(_params, _session, socket) do
    if connected?(socket), do: register_timer(self(), 0)

    {:ok,
     socket
     |> stream(:persons, Form.list_persons())}
  end

  @doc """
  handle_params is invoved to uri and query params can be handled. After this
  is run for the first time, render/1 is finally called, sending HTML to the client.
  """
  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Person")
    |> assign(:person, Form.get_person!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Person")
    |> assign(:person, %Person{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Persons")
    |> assign(:person, nil)
  end

  @impl true
  def handle_info({MCWeb.PersonLive.FormComponent, {:saved, person}}, socket) do
    {:noreply, stream_insert(socket, :persons, person)}
  end

  def handle_info(:update_time, socket) do
    register_timer(self(), 1000)
    {:noreply, push_event(socket, "time_tick", %{time: DateTime.to_iso8601(DateTime.utc_now())})}
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    person = Form.get_person!(id)
    {:ok, _} = Form.delete_person(person)

    {:noreply, stream_delete(socket, :persons, person)}
  end

  defp register_timer(pid, time) do
    Process.send_after(pid, :update_time, time)
  end
end
