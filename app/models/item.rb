class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  validates :name,             presence: true
  validates :description,      presence: true
  validates :category_id,      presence: true
  validates :condition_id,     presence: true
  validates :shipping_cost_id, presence: true
  validates :prefecture_id,    presence: true
  validates :shipping_date_id, presence: true
  validates :price,            presence: true
  validates :user,             presence: true

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :condition

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :shipping_cost

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :shipping_date

end
