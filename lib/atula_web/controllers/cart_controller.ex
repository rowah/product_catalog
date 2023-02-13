defmodule AtulaWeb.CartController do
  use AtulaWeb, :controller

  alias Atula.ShoppingCart

  def show(conn, _params) do
    render(conn, "show.html", changeset: ShoppingCart.change_cart(conn.assigns.cart))
  end
end
