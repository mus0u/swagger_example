# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

import_config "jsonapi.exs"

# General application configuration
config :swagger_example, ecto_repos: [SwaggerExample.Repo]

config :swagger_example, SwaggerExample.Repo, adapter: Ecto.Adapters.Postgres

# Configures the endpoint
config :swagger_example, SwaggerExampleWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base:
    System.get_env("SECRET_KEY_BASE") ||
      "BYDs771vLUo++dbVMUMhAkUUv8xvkJUtN7vBd/5UAaZ+PweinJxtJ60NGosmiJWA",
  render_errors: [view: SwaggerExampleWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: SwaggerExample.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :swagger_example, :phoenix_swagger,
  swagger_files: %{
    "priv/static/swagger.json" => [
      # phoenix routes will be converted to swagger paths
      router: SwaggerExampleWeb.Router,
      # (optional) endpoint config used to set host, port and https schemes.
      endpoint: SwaggerExampleWeb.Endpoint
    ]
  }

config :swagger_example, SwaggerExample.Repo, read_after_writes: true

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
