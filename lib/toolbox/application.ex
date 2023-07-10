defmodule MC.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      MCWeb.Telemetry,
      # Start the Ecto repository
      MC.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: MC.PubSub},
      # Start Finch
      {Finch, name: MC.Finch},
      # Start the Endpoint (http/https)
      MCWeb.Endpoint
      # Start a worker by calling: MC.Worker.start_link(arg)
      # {MC.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: MC.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    MCWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
