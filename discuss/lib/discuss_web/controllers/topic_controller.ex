defmodule DiscussWeb.TopicController do
  use DiscussWeb, :controller

  # Need to manually import Repo
  alias Discuss.Repo
  alias Discuss.Content.Topic

  # def show(conn, %{"id" => id}) do
  #   topic = Content
  # end
  
  def create(conn, %{"topic" => topic_params}) do
    changeset = Topic.changeset(%Topic{}, topic_params)

    case Repo.insert(changeset) do
      {:ok, post} -> IO.inspect(post)
      {:error, changeset} -> IO.inspect(changeset)
    end
  end

  # alias Discuss.Content
  # alias Discuss.Content.Topic

  # action_fallback DiscussWeb.FallbackController

  # def index(conn, _params) do
  #   topics = Content.list_topics()
  #   render(conn, "index.json", topics: topics)
  # end

  # def create(conn, %{"topic" => topic_params}) do
  #   with {:ok, %Topic{} = topic} <- Content.create_topic(topic_params) do
  #     conn
  #     |> put_status(:created)
  #     |> put_resp_header("location", Routes.topic_path(conn, :show, topic))
  #     |> render("show.json", topic: topic)
  #   end
  # end

  # def show(conn, %{"id" => id}) do
  #   topic = Content.get_topic!(id)
  #   render(conn, "show.json", topic: topic)
  # end

  # def update(conn, %{"id" => id, "topic" => topic_params}) do
  #   topic = Content.get_topic!(id)

  #   with {:ok, %Topic{} = topic} <- Content.update_topic(topic, topic_params) do
  #     render(conn, "show.json", topic: topic)
  #   end
  # end

  # def delete(conn, %{"id" => id}) do
  #   topic = Content.get_topic!(id)

  #   with {:ok, %Topic{}} <- Content.delete_topic(topic) do
  #     send_resp(conn, :no_content, "")
  #   end
  # end
end