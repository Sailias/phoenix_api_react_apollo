defmodule Api.Accounts.Graphql.Mutations do
  import Kronky.Payload
  use Absinthe.Schema.Notation

  alias Api.Accounts.Resolvers.{
    LoginResolver
  }
  
  payload_object(:user_payload, :user)

  object :accounts_mutations do
    
    field :login, :user_payload do
      arg :email, :string
      arg :password, :string

      resolve &LoginResolver.login/3
    end

  end

end