defmodule ElixirRest.Router do
  # Bring Plug.Router module into scope.
  use Plug.Router

  # Attach the logger so we can see incoming requests.
  plug(Plug.Logger)

  # Tell Plug to match certain incoming requests.
  plug(:match)

  # Once there is a match, parse the response body if the content-type is
  # application/json. Order is important here, as we only want to parse the
  # body if there is a matching route.(Using the Jason parser).
  plug(Plug.Parsers,
    parsers: [:json],
    pass: ["application/json"],
    json_decoder: Jason
  )

  # Dispatch the connection to the matched handler.
  plug(:dispatch)

  # Handler for GET request on "/".
  get "/" do
    send_resp(conn, 200, "OK")
  end

  # Fallback handler when we have no match.
  match _ do
    send_resp(conn, 404, "Not Found")
  end
end
