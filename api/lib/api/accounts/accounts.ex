defmodule Api.Accounts do

  alias Api.{
    Repo,
    Accounts.User
  }

  def find_user(id) do
    Repo.get(User, id)
  end

  def create_user(attrs \\ %{}) do
    changeset = User.changeset(%User{}, attrs)
    Repo.insert(changeset)
  end

  def find_user_by_token(token) do
    {:ok, claims} = Api.Accounts.Guardian.decode_and_verify(token)
    Api.Accounts.Guardian.resource_from_claims(claims)
  end

end