class Item < ApplicationRecord
  
  belongs_to :user
  belongs_to :genre
  
  attachment :item_image
  
end