defmodule Api.Web.Graphql.Helpers do
  import Kronky.Payload

  def payload_formatter(payload) do
    payload
    |> case do
      {:ok, payload} -> {:ok, success_payload(payload)}
      {:error, %Ecto.Changeset{} = changeset} -> {:ok, convert_to_payload(changeset)}
      error -> {:ok, convert_to_payload(error)}
    end
  end

end
