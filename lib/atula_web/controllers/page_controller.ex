defmodule AtulaWeb.PageController do
  use AtulaWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
