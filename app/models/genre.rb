# frozen_string_literal: true

class Genre < ApplicationRecord
  belongs_to :user

  has_many :items

  validates :name, presence: true, length: { maximum: 10 }
end
