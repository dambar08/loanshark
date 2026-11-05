module Aml
  module NameScreening
    class Screen
      def self.call(...)
        new(...).call
      end

      def initialize(user)
        @user = user
      end

      def call
        ::Aml::NameScreeningJob.perform_async(@user.id)
      end
    end
  end
end
