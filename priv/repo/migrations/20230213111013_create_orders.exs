defmodule Atula.Repo.Migrations.CreateOrders do
  use Ecto.Migration

  def change do
    create table(:orders) do
      add :user_uuid, :uuid
      add :total_price, :decimal

      timestamps()
    end
  end
end
