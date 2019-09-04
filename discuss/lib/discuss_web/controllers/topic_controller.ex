defmodule DiscussWeb.TopicController do
  use DiscussWeb, :controller

  # Need to manually import Repo
  alias Discuss.Repo
  alias Discuss.Content.Topic

  action_fallback DiscussWeb.FallbackController

  def index(conn, _params) do
    topics = Repo.all(Topic)

    render conn, "index.json", topics: topics
  end

  def create(conn, %{"topic" => topic_params}) do
    changeset = Topic.changeset(%Topic{}, topic_params)

    with {:ok, %Topic{} = topic} <- Repo.insert(changeset) do
      render conn, "show.json", topic: topic
    end

    # case Repo.insert(changeset) do
    #   {:ok, post} ->
    # 	render conn, "show.json", topic: post
    #   {:error, changeset} ->
    # 	# conn
    # 	# |> put_status(:created)
    # 	# |> render("show.json", )
    # 	IO.inspect(changeset)
    # end
  end

  def show(conn, %{"id" => topic_id}) do
    topic = Repo.get!(Topic, topic_id)

    render conn, "show.json", topic: topic
  end
  
  def update(conn, %{"id" => topic_id, "topic" => topic}) do
    changeset = Repo.get(Topic, topic_id) |> Topic.changeset(topic)

    case Repo.update(changeset) do
      {:ok, new_topic} ->
	render conn, "show.json", topic: new_topic
      {:error, changeset} ->
	IO.inspect(changeset)
    end
  end

  def delete(conn, %{"id" => topic_id}) do
    Repo.get!(Topic, topic_id) |> Repo.delete!
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
