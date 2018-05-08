defmodule Api.Blog.Post do
  use Ecto.Schema
  import Ecto.Changeset
  
  schema "posts" do
    belongs_to :user, Api.Accounts.User

    field :title, :string
    field :body, :string

    timestamps()
  end

  def changeset(post, attrs) do
    post
    |> cast(attrs, [:user_id, :title, :body])
    |> validate_required([:user_id, :title, :body])
  end
  
  def update_changeset(post, attrs) do
    post
    |> cast(attrs, [:title, :body])
    |> validate_required([:title, :body])
  end

end