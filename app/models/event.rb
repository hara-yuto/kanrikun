class Event < ApplicationRecord
  belongs_to :user

  validates :title, presence: true
  validates :worktime,format: { with: /\A[-]?[0-9]+(\.[0-9]+)?\z/ }
  
  
end
