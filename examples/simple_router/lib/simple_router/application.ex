defmodule SimpleRouter.Application do
  @moduledoc false

  use Application

  def start(_type, _args) do
    SimpleRouter.Supervisor.start_link()
  end
end
