defmodule Joker.Application do
  @moduledoc false

  use Application

  @impl Application
  def start(_type, _args) do
    children = maybe_bot_children()

    opts = [strategy: :one_for_one, name: Joker.Supervisor]
    Supervisor.start_link(children, opts)
  end

  defp maybe_bot_children do
    if Application.get_env(:joker, :start_bot?, true) do
      token = Application.fetch_env!(:joker, JokerBot.Dispatcher)[:token]

      [
        ExGram,
        {JokerBot.Dispatcher, [method: :polling, token: token]}
      ]
    else
      []
    end
  end
end
