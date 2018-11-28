defmodule InputsForExample.Repo do
  use Ecto.Repo,
    otp_app: :inputs_for_example,
    adapter: Ecto.Adapters.Postgres
end
