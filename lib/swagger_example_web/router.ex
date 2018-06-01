defmodule SwaggerExampleWeb.Router do
  use SwaggerExampleWeb, :router

  pipeline :api do
    plug(:accepts, ["json-api"])
    plug(JSONAPI.EnsureSpec)
  end

  scope "/swagger" do
    forward(
      "/",
      PhoenixSwagger.Plug.SwaggerUI,
      otp_app: :swagger_example,
      swagger_file: "swagger.json",
      disable_validator: true
    )
  end

  def swagger_info do
    %{
      info: %{
        version: "1.0",
        title: "Swagger Example"
      }
    }
  end

  scope "/api", SwaggerExampleWeb, as: :api do
    pipe_through(:api)

    scope "/v1", as: :v1 do
      resources("/tree_nodes", TreeNodeController, only: [:index])
    end
  end
end
