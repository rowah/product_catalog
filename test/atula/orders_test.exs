defmodule Atula.OrdersTest do
  use Atula.DataCase

  alias Atula.Orders

  describe "orders" do
    alias Atula.Orders.Order

    import Atula.OrdersFixtures

    @invalid_attrs %{total_price: nil, user_uuid: nil}

    test "list_orders/0 returns all orders" do
      order = order_fixture()
      assert Orders.list_orders() == [order]
    end

    test "get_order!/1 returns the order with given id" do
      order = order_fixture()
      assert Orders.get_order!(order.id) == order
    end

    test "create_order/1 with valid data creates a order" do
      valid_attrs = %{total_price: "120.5", user_uuid: "7488a646-e31f-11e4-aace-600308960662"}

      assert {:ok, %Order{} = order} = Orders.create_order(valid_attrs)
      assert order.total_price == Decimal.new("120.5")
      assert order.user_uuid == "7488a646-e31f-11e4-aace-600308960662"
    end

    test "create_order/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Orders.create_order(@invalid_attrs)
    end

    test "update_order/2 with valid data updates the order" do
      order = order_fixture()
      update_attrs = %{total_price: "456.7", user_uuid: "7488a646-e31f-11e4-aace-600308960668"}

      assert {:ok, %Order{} = order} = Orders.update_order(order, update_attrs)
      assert order.total_price == Decimal.new("456.7")
      assert order.user_uuid == "7488a646-e31f-11e4-aace-600308960668"
    end

    test "update_order/2 with invalid data returns error changeset" do
      order = order_fixture()
      assert {:error, %Ecto.Changeset{}} = Orders.update_order(order, @invalid_attrs)
      assert order == Orders.get_order!(order.id)
    end

    test "delete_order/1 deletes the order" do
      order = order_fixture()
      assert {:ok, %Order{}} = Orders.delete_order(order)
      assert_raise Ecto.NoResultsError, fn -> Orders.get_order!(order.id) end
    end

    test "change_order/1 returns a order changeset" do
      order = order_fixture()
      assert %Ecto.Changeset{} = Orders.change_order(order)
    end
  end
end
