class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  # テーブルとのアソシエーション
  belongs_to :user
  has_one    :purchase

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
    validates :category_id, numericality: { other_than: 0, message: "can't be blank" }
    validates :condition_id, numericality: { other_than: 0, message: "can't be blank" }
    validates :shipping_cost_id, numericality: { other_than: 0, message: "can't be blank" }
    validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }
    validates :shipping_date_id, numericality: { other_than: 0, message: "can't be blank" }
    validates :price,
              numericality: { allow_blank: true, greater_than_or_equal_to: 300,
                              less_than_or_equal_to: 9_999_999, only_integer: true }
  end
end
