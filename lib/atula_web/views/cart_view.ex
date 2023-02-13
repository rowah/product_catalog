defmodule AtulaWeb.CartView do
  use AtulaWeb, :view

  alias Atula.ShoppingCart

#to display the cart prices like product item price, cart total, etc, so we define a currency_to_str/1 which takes our decimal struct, rounds it properly for display, and prepends a USD dollar sign
  def currency_to_str(%Decimal{} = val), do: "$#{Decimal.round(val, 2)}"
end
