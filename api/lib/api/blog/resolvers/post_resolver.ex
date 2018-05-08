defmodule Api.Blog.Resolvers.PostResolver do
  import Ecto.Query, warn: false

  alias Api.{
    Repo,
    Blog.Post
  }

  def list_posts(_parent, _args, %{ context: context }) do
    query = 
      Post
      |> preload(:user)

    { :ok, Repo.all(query) }
  end

end