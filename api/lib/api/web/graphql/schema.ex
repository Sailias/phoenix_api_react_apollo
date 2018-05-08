defmodule Api.Web.Graphql.Schema do
  use Absinthe.Schema

  # Accounts
  import_types Api.Accounts.Graphql.Types

  # Blog
  import_types Api.Blog.Graphql.Types
  import_types Api.Blog.Graphql.Fields

  query do
    import_fields :blog_fields
  end

end