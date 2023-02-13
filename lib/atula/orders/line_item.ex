defmodule Atula.Orders.LineItem do
  use Ecto.Schema
  import Ecto.Changeset

  schema "order_line_items" do
    field :price, :decimal
    field :quantity, :integer

#associate line items to orders and products
    belongs_to :order, Atula.Orders.Order
    belongs_to :product, Atula.Catalog.Product

    timestamps()
  end

  @doc false
  def changeset(line_item, attrs) do
    line_item
    |> cast(attrs, [:price, :quantity])
    |> validate_required([:price, :quantity])
  end
end
