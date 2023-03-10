class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  # テーブルとのアソシエーション
  belongs_to :user

  # アクティブハッシュとのアソシエーション
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_cost
  belongs_to :prefecture
  belongs_to :shipping_date

  # active_storageとのアソシエーション
  has_one_attached :image

  # テーブルへのバリデーション
  with_options presence: true do
    validates :image
    validates :name
    validates :description
    validates :category_id
    validates :condition_id
    validates :shipping_cost_id
    validates :prefecture_id
    validates :shipping_date_id
    validates :price,
              numericality: { allow_blank: true, greater_than_or_equal_to: 300,
                              less_than_or_equal_to: 9_999_999, only_integer: true }
  end
end
