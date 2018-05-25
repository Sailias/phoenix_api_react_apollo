defmodule Api.Blog do

  alias Api.{
    Repo,
    Blog.Policy,
    Blog.Post
  }

  defdelegate authorize(action, user, params), to: Policy

  def create_post(attrs) do
    changeset = Post.changeset(%Post{}, attrs)
    Repo.insert(changeset)
  end

  def update_post(post, attrs) do
    changeset = Post.update_changeset(post, attrs)
    Repo.update(changeset)
  end

end