defmodule Api.Blog.Policy do
  @behaviour Bodyguard.Policy

  alias Api.Accounts.User
  alias Api.Blog.Post

  # Authorize logged in users
  def authorize(:create_post, %User{}, _), do: true

  def authorize(action, %User{id: user_id}, %Post{user_id: user_id}) when action in [:update_post, :delete_post], do: true

  # Default deny all
  def authorize(action, user, params), do: false 

end