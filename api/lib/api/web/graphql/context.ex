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
    %{ }
  end

end