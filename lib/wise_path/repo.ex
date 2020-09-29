defmodule WisePath.Repo do
  use Ecto.Repo,
    otp_app: :wise_path,
    adapter: Ecto.Adapters.Postgres
end
