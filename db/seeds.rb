# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


Admin.create_with(password: "password", confirmed_at: Time.current).find_or_create_by!(email: "a@mail.com")

user_emails = [ "u@mail.com", "u1@mail.com", "u2@mail.com", "u3@mail.com", "u4@mail.com", "u5@mail.com" ]
user_emails.each do |email|
    User.create_with(password: "password", confirmed_at: Time.current).find_or_create_by!(email: email)
end

100.times do
    loan = User.all.sample.loans.build
    loan.amount = "1000000"
    loan.tenor = 36
    loan.application_id = SecureRandom.hex(8)
    loan.save!
end


User.all.each do  |user|
  Aml::NameScreening::Screen.call(user)
end