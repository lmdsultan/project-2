class Movie < ApplicationRecord

  belongs_to :user
  has_many :actors, dependent: :destroy

end
