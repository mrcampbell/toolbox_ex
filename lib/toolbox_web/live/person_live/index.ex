defmodule MCWeb.PersonLive.Index do
  use MCWeb, :live_view

  alias MC.Form
  alias MC.Form.Person

  @impl true
  def mount(_params, _session, socket) do
    {:ok, stream(socket, :persons, Form.list_persons())}
  end

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

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    person = Form.get_person!(id)
    {:ok, _} = Form.delete_person(person)

    {:noreply, stream_delete(socket, :persons, person)}
  end
end
