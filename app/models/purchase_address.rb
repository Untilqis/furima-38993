class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :house_number, :building, :phone_number, :purchase, :user_id, :item_id,
                :token

  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :prefecture_id
    validates :city
    validates :house_number
    validates :phone_number, format: /\A[0-9]+\z/
    validates :user_id
    validates :item_id
    # validates :token
  end

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, house_number: house_number,
                   building: building, phone_number: phone_number, purchase_id: purchase.id)
  end
end
