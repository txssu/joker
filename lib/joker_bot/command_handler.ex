defmodule JokerBot.CommandHandler do
  @moduledoc false

  alias JokerBot.Reply

  @spec handle(ExGram.Dispatcher.parsed_message(), ExGram.Cnt.t()) :: Reply.t()
  def handle({:command, :privacy, _msg} = msg, context) do
    JokerBot.PrivacyCommand.handle(msg, context)
  end

  def handle(_msg, _context) do
    %Reply{halt: true}
  end
end
