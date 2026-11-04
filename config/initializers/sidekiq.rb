Sidekiq.configure_server do |config|
  config.redis = { url:  ENV.fetch("REDIS_URL") { "redis://localhost:6379/0" } }
  config.redis = { id: "Sidekiq-server-PID-#{::Process.pid}" }
  config.logger = Sidekiq::Logger.new($stdout)
  config.logger.level = Logger::WARN # INFO/WARN
  config.error_handlers << proc { |ex, ctx_hash, config| ErrorService.notify(ex, ctx_hash) }

  config.death_handlers << ->(job, ex) do
    puts "Uh oh, #{job['class']} #{job["jid"]} just died with error #{ex.message}."
  end
end

Sidekiq.configure_client do |config|
  config.redis = { url: ENV.fetch("REDIS_URL") { "redis://localhost:6379/0" } }
end

# Default options for all sidekiq jobs
Sidekiq.default_job_options = { "backtrace" => true }

Sidekiq.transactional_push!
