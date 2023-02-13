defmodule Atula.Repo.Migrations.CreateOrders do
  use Ecto.Migration

  def change do
    create table(:orders) do
      add :user_uuid, :uuid
      #gives appropriate precision and scale options for decimal column/not-null constraint enforces all orders price.
      add :total_price, :decimal, precision: 10, scale: 6, null: false

      timestamps()
    end
  end
end
