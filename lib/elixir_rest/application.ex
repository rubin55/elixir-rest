defmodule ElixirRest.Application do
  use Application

  @impl true
  def start(_type, _args) do
    children = [
      {Plug.Cowboy,
       scheme: :http,
       plug: ElixirRest.Router,
       options: [port: Application.get_env(:elixir_rest, :app_port)]}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html.
    opts = [strategy: :one_for_one, name: ElixirRest.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
