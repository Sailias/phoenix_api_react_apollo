defmodule Api.Web.Graphql.Context do
  @behaviour Plug

  import Plug.Conn
  import Ecto.Query, warn: false
 
  def init(opts), do: opts

  def call(conn, _) do
    context = build_context(conn)
    put_private(conn, :absinthe, %{context: context})
  end
  
  def build_context(conn) do
    { current_user, token } = 
      with ["Bearer " <> token] <- get_req_header(conn, "authorization"),
           {:ok, current_user} <- authorize(token) do
        { current_user, token }
      else
        _ -> { %{}, nil }
      end

    %{ current_user: current_user }
  end

  defp authorize(token) do
    Api.Accounts.find_user_by_token(token)
  end

end