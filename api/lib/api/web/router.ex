defmodule Api.Web.Router do
  use Api.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
    plug Api.Web.Graphql.Context
  end

  scope "/api" do
    pipe_through :api

    forward "/graphiql", Absinthe.Plug.GraphiQL, schema: Api.Web.Graphql.Schema
    forward "/", Absinthe.Plug, schema: Api.Web.Graphql.Schema
  end
end
