defmodule Api.Accounts.Guardian do
  use Guardian, otp_app: :api

  def subject_for_token(resource, _claims) do
    sub = to_string(resource.id)
    {:ok, sub}
  end

  def resource_from_claims(claims) do
    resource = Api.Repo.get(Api.Accounts.User, claims["sub"])
    {:ok, resource}
  end
end