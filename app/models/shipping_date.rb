class ShippingDate < ActiveHash::Base
  self.data = [
    { id: 0, name: '---' }
    { id: 1, name: '1~2日で発送' },
    { id: 2, name: '3~4日で配送' },
    { id: 3, name: '4~7日で配送' }
  ]
end
