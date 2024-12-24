import Config

env_config = "#{config_env()}.exs"

config_exists? = fn name ->
  "config"
  |> Path.join(name)
  |> File.exists?()
end

if config_exists?.(env_config) do
  import_config env_config
end

if config_exists?.("local.exs") do
  import_config "local.exs"
end
