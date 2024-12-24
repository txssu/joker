import Config

if config_env() != :test do
  config :joker, JokerBot.Dispatcher, token: System.get_env("TELEGRAM_TOKEN")
end
