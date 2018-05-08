# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :api,
  ecto_repos: [Api.Repo]

# Configures the endpoint
config :api, Api.Web.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "D6B/nyDUCg9m9J7Ta/+qFS2Fpn9RvFI4dwlw6NgXR6uRgfzIJd6UaQbhC3NdYHSv",
  render_errors: [view: Api.Web.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Api.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]


config :api, Api.Accounts.Guardian,
       issuer: "api",
       secret_key: "x1hya5bbfe6A86KuYPQPP6mKWAR9BT6lA7g5G7UgxKS7Mc+4pL/OaqLCpXeNzi/l"

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
