defmodule Api.Blog.Policy do
  @behaviour Bodyguard.Policy

  alias Api.Accounts.User

  # Authorize logged in users
  def authorize(:create_post, %User{}, _), do: true

  # Default deny all
  def authorize(action, user, params), do: false 

end