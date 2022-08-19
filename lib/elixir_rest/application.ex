defmodule ElixirRest.Application do
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      {Plug.Cowboy, scheme: :http, plug: ElixirRest.Router, options: [port: 8080]}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html.
    opts = [strategy: :one_for_one, name: ElixirRest.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
