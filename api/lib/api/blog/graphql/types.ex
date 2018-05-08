defmodule Api.Blog.Graphql.Types do
  use Absinthe.Schema.Notation

  object :post do
    field :id, :id
    field :user, :user

    field :title, :string
    field :body, :string
  end

end