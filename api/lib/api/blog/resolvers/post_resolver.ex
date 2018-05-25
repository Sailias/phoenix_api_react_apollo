defmodule Api.Blog.Resolvers.PostResolver do
  import Ecto.Query, warn: false

  alias Api.{
    Repo,
    Blog,
    Blog.Post
  }

  def list_posts(_args, %{ context: context }) do
    { :ok, Repo.all(Post) }
  end

  def find_post(args, %{ context: context }) do
    { :ok, Repo.get(Post, args[:id]) }
  end

  def create_post(args, %{ context: context }) do
    with :ok <- Bodyguard.permit(Blog, :create_post, context.current_user)
    do
      args
      |> Map.put(:user_id, context.current_user.id)
      |> Blog.create_post()
    else
      error -> {:error, %Kronky.ValidationMessage{code: 403, message: "Forbidden"}}
    end
    |> Api.Web.Graphql.Helpers.payload_formatter()
  end

  def update_post(args, %{ context: context }) do
    with post when not is_nil(post) <- Repo.get(Post, args[:id]),
         :ok <- Bodyguard.permit(Blog, :update_post, context.current_user, post)
    do
      Blog.update_post(post, args)
    else
      nil -> {:error, %Kronky.ValidationMessage{code: 404, message: "post not found"}}
      {:error, :unauthorized} -> {:error, %Kronky.ValidationMessage{code: 403, message: "Forbidden"}}
    end
    |> Api.Web.Graphql.Helpers.payload_formatter()
  end

end
