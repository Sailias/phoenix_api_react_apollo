alias Api.{
  Accounts,
  Blog
}

{ :ok, admin_user } = Accounts.create_user(%{
  email: "admin@example.com",
  password: "password",
  admin: true
})

{ :ok, user } = Accounts.create_user(%{
  email: "user@example.com",
  password: "password"
})


Blog.create_post(%{
  title: "Admin Post 1",
  body: "Post created by admin",
  user_id: admin_user.id
})

Blog.create_post(%{
  title: "User Post 1",
  body: "Post created by user",
  user_id: user.id
})

Blog.create_post(%{
  title: "User Post 2",
  body: "Post created by user",
  user_id: user.id
})