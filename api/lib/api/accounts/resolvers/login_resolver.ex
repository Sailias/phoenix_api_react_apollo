defmodule Api.Accounts.Resolvers.LoginResolver do
  import Ecto.Query, warn: false
  import Kronky.Payload

  alias Api.{
    Repo,
    Accounts.User
  }

  def login(_parent, args, %{ context: context }) do
    with {:ok, user} <- authenticate_user(args),
         {:ok, token, _claims} <- Api.Accounts.Guardian.encode_and_sign(user),
         user <- Map.put(user, :token, token)
    do
      { :ok, success_payload(user) }
    else
      {:error, message} -> {:ok, convert_to_payload({:error, message})}
    end
  end

  defp authenticate_user(%{ email: email, password: password }) do
    query =
      User
      |> where([u], u.email == ^email)

    Repo.one(query)
    |> check_password(password)
  end
  defp authenticate_user(args), do: {:error, "Incorrect username or password"}

  defp check_password(nil, _), do: {:error, "Incorrect username or password"}
  defp check_password(user, given_password) do
    case Comeonin.Bcrypt.checkpw(given_password, user.password_hash) do
      true -> {:ok, user}
      false -> {:error, "Incorrect username or password"}
    end
  end

end