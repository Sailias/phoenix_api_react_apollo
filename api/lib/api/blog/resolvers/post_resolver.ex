defmodule Api.Blog.Resolvers.PostResolver do
  import Ecto.Query, warn: false

  alias Api.{
    Repo,
    Blog,
    Blog.Post
  }

  def list_posts(_parent, _args, %{ context: context }) do
    query = preload(Post, :user)
    { :ok, Repo.all(query) }
  end

  def create_post(_parent, args, %{ context: context }) do
    with :ok <- Bodyguard.permit(Blog, :create_post, context.current_user)
    do
      args 
      |> Map.put(:user_id, context.current_user.id)
      |> Blog.create_post()
    else
      error -> {:error, "unauthorized"}
    end
    |> Api.Web.Graphql.Helpers.payload_formatter()
  end

end