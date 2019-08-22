defmodule ApiWeb.Router do
  use ApiWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", ApiWeb do
    pipe_through :api

    resources "/miembros", MiembroController, except: [:new, :edit]
    resources "/plantillas", PlantillaController, except: [:new, :edit]
    resources "/textos", TextoController, except: [:new, :edit]
  end
end
