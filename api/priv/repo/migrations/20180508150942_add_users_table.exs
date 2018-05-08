defmodule Api.Repo.Migrations.AddUsersTable do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :email, :string
      add :password_hash, :string
      add :admin, :boolean, default: false

      timestamps()
    end
  end
end
