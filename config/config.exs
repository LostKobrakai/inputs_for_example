# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :inputs_for_example,
  ecto_repos: [InputsForExample.Repo]

# Configures the endpoint
config :inputs_for_example, InputsForExampleWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "afTNY4WsEtbFXw5on0x2Kspov6vQ53Yaieo2yv+FL0EdHnkz2YhQM1rLE1RdQ4YF",
  render_errors: [view: InputsForExampleWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: InputsForExample.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
