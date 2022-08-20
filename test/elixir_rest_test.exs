defmodule ElixirRestTest do
  # Bring ExUnit.Case module into scope, run parallel test.
  use ExUnit.Case, async: true

  # Bring Plug.Test module into scope.
  # This makes the conn object available.
  use Plug.Test

  # We call Plug.init/1 function with options and then
  # store returned options in a Module attribute opts.
  # Note: @ is module attribute unary operator.
  @opts ElixirRest.Router.init([])

  test "return ok" do
    # Build a connection with GET to "/".
    conn = conn(:get, "/")

    # Then execute and get results.
    conn = ElixirRest.Router.call(conn, @opts)

    # Assert validity of results.
    assert conn.state == :sent
    assert conn.status == 200
    assert conn.resp_body == "OK #{Application.get_env(:elixir_rest, :app_name)}"
  end
end
