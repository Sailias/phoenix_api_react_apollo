defmodule Api.Accounts.Graphql.Types do
  use Absinthe.Schema.Notation

  object :user do
    field :id, :id
    field :email, :string
    field :token, :string
  end

end