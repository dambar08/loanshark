class Aml::NameScreeningJob
  include Sidekiq::Job

  sidekiq_options retry: 1, lock: :until_executed

  def perform(user_id)
    user = User.find_by_id(user_id)
    nil unless user

    # Perform some checks here. For now its hard coded
    ActiveRecord::Base.transaction do
      name_screening = user.name_screenings.create!
      name_screening.name_screening_records.create!(
        risk_level: NameScreeningRecord::RISK_LEVELS.sample,
        pep_status: NameScreeningRecord::NS_STATUSES.sample,
        sanction_status: NameScreeningRecord::NS_STATUSES.sample,
        adverse_media_status: NameScreeningRecord::NS_STATUSES.sample,
        law_enforcement_status: NameScreeningRecord::NS_STATUSES.sample
      )
    end
  end
end
