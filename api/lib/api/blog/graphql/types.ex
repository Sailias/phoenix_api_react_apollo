defmodule Api.Blog.Graphql.Types do
  use Absinthe.Schema.Notation

  alias Api.{
    Repo,
    Accounts.User
  }

  object :post do
    field :id, :id
    field :title, :string
    field :body, :string

    # Only load the user if it was requested
    field :user, :user do
      resolve fn(post, _, _) ->
        { :ok, Api.Repo.get(User, post.user_id) }
      end
    end
  end
end