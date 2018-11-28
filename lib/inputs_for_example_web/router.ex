defmodule InputsForExampleWeb.Router do
  use InputsForExampleWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", InputsForExampleWeb do
    pipe_through :browser

    resources "/", ParentController
  end

  # Other scopes may use custom stacks.
  # scope "/api", InputsForExampleWeb do
  #   pipe_through :api
  # end
end
