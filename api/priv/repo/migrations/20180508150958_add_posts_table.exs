defmodule Api.Repo.Migrations.AddPostsTable do
  use Ecto.Migration

  def change do
    create table(:posts) do
      add :user_id, references(:users)

      add :title, :string
      add :body, :string

      timestamps()
    end

    create index(:posts, [:user_id])
  end
end
