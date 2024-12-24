defmodule JokerBot.Dispatcher do
  @moduledoc false
  use ExGram.Bot, name: :joker, setup_commands: true

  alias JokerBot.CommandHandler
  alias JokerBot.Reply

  command("privacy", description: "Политика конфиденциальности")

  middleware(ExGram.Middleware.IgnoreUsername)

  @spec handle(ExGram.Dispatcher.parsed_message(), ExGram.Cnt.t()) :: ExGram.Cnt.t()
  def handle(request_message, context) do
    %Reply{} = response_message = CommandHandler.handle(request_message, context)

    response_message
    |> check_halt()
    |> check_direct_message_only(context)
    |> send_reply(context)
  end

  defp check_halt(%Reply{halt: true} = reply), do: {:halt, reply}
  defp check_halt(%Reply{halt: false} = reply), do: {:cont, reply}

  defp check_direct_message_only({:halt, reply}, _context), do: {:halt, reply}

  defp check_direct_message_only({:cont, reply}, cnt) do
    if reply.direct_message_only and cnt.update.message.chat.type == "private" do
      {:cont, reply}
    else
      {:halt, nil}
    end
  end

  defp send_reply({:halt, _reply}, context), do: context

  defp send_reply({:cont, reply}, context) do
    answer(context, reply.text)
  end
end
