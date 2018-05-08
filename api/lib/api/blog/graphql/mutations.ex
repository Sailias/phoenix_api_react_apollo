defmodule Api.Blog.Graphql.Mutations do
  import Kronky.Payload
  use Absinthe.Schema.Notation

  alias Api.Blog.Resolvers.{
    PostResolver
  }

  payload_object(:post_payload, :post)

  object :blog_mutations do

    field :create_post, :post_payload do
      arg :title, :string
      arg :body, :string

      resolve &PostResolver.create_post/3
    end

    field :update_post, :post_payload do
      arg :id, non_null(:id)
      arg :title, :string
      arg :body, :string

      resolve &PostResolver.update_post/3
    end

  end

end