defmodule DiscussWeb.TopicView do
  use DiscussWeb, :view
  alias DiscussWeb.TopicView

  def render("index.json", %{topics: topics}) do
    %{message: "ok", data: render_many(topics, TopicView, "topic.json")}
  end

  def render("show.json", %{topic: topic}) do
    %{message: "ok", data: render_one(topic, TopicView, "topic.json")}
  end

  def render("topic.json", %{topic: topic}) do
    %{id: topic.id,
      title: topic.title}
  end
end
