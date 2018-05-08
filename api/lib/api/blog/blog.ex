defmodule Api.Blog do

  alias Api.{
    Repo,
    Blog.Post
  }

  def create_post(attrs) do
    changeset = Post.changeset(%Post{}, attrs)
    Repo.insert(changeset)
  end

end