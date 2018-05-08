defmodule Api.Accounts do

  alias Api.{
    Repo,
    Accounts.User
  }

  def create_user(attrs \\ %{}) do
    changeset = User.changeset(%User{}, attrs)
    Repo.insert(changeset)
  end

end