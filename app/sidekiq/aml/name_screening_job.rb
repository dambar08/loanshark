class Aml::NameScreeningJob
  include Sidekiq::Job

  sidekiq_options retry: 1

  def perform(*args)
  end
end
