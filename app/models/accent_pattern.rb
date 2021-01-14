class AccentPattern < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '頭高型' },
    { id: 3, name: '中高型' },
    { id: 4, name: '尾高型' },
    { id: 5, name: '平板型' }
  ]

  include ActiveHash::Associations
  has_many :accents
end
