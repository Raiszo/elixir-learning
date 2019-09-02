defmodule DiscussWeb.Router do
  use DiscussWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", DiscussWeb do
    pipe_through :api

    post "/topics", TopicController, :create
    get "/topics", TopicController, :index
    get "/topics/:id", TopicController, :show
    put "/topics/:id", TopicController, :update
  end
end
