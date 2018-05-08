defmodule Api.Blog.Graphql.Fields do
  use Absinthe.Schema.Notation

  alias Api.Blog.Resolvers.{
    PostResolver
  }

  object :blog_fields do

    field :posts, list_of(:post) do
      resolve &PostResolver.list_posts/3
    end
    
  end

end