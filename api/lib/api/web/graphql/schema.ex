defmodule Api.Web.Graphql.Schema do
  use Absinthe.Schema

  # Default
  import_types Absinthe.Type.Custom
  import_types Kronky.ValidationMessageTypes

  # Accounts
  import_types Api.Accounts.Graphql.Types
  import_types Api.Accounts.Graphql.Mutations

  # Blog
  import_types Api.Blog.Graphql.Types
  import_types Api.Blog.Graphql.Fields
  import_types Api.Blog.Graphql.Mutations

  query do
    import_fields :blog_fields
  end

  mutation do
    import_fields :accounts_mutations
    import_fields :blog_mutations
  end

end