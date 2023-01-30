defmodule Atula.Repo do
  use Ecto.Repo,
    otp_app: :atula,
    adapter: Ecto.Adapters.Postgres
end
