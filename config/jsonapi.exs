use Mix.Config

config :phoenix, :format_encoders, "json-api": Poison

config :mime, :types, %{
  "application/vnd.api+json" => ["json-api"]
}

config :jsonapi,
  host: "localhost",
  scheme: "http",
  remove_links: true
