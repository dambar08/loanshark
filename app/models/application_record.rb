class ApplicationRecord < ActiveRecord::Base
  has_paper_trail
  primary_abstract_class
end
