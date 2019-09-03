defmodule DiscussWeb.FallbackController do
  @moduledoc """
  Translates controller action results into valid `Plug.Conn` responses.

  See `Phoenix.Controller.action_fallback/1` for more details.
  """
  use DiscussWeb, :controller

  def call(conn, {:error, :not_found}) do
    conn
    |> put_status(:not_found)
    |> put_view(DiscussWeb.ErrorView)
    |> render(:"404")
  end

  def call(conn, {:error, %Ecto.Changeset{} = changeset}) do
    conn
    |> put_view(DiscussWeb.ChangesetView)
    |> render(:"400", changeset: changeset)
  end
end
