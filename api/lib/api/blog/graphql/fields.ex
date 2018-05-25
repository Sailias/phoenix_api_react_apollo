defmodule Api.Blog.Graphql.Fields do
  use Absinthe.Schema.Notation

  alias Api.Blog.Resolvers.{
    PostResolver
  }

  object :blog_fields do

    field :post, :post do
      arg :id, :id
      resolve &PostResolver.find_post/2
    end

    field :posts, list_of(:post) do
      resolve &PostResolver.list_posts/2
    end
    
  end

end