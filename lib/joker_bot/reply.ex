defmodule JokerBot.Reply do
  @moduledoc false

  use TypedStruct

  typedstruct do
    field(:text, String.t())
    field(:direct_message_only, boolean(), default: false)
    field(:halt, boolean(), default: false)
  end
end
