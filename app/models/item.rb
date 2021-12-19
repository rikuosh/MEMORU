class Item < ApplicationRecord

  belongs_to :user
  belongs_to :genre

  attachment :item_image

  validates :name, presence: true, length: {maximum: 15}
  validates :purchase_date, presence: true
end
