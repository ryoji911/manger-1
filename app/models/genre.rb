class Genre < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '和食' },
    { id: 3, name: 'イタリアン' },
    { id: 4, name: 'フレンチ' },
    { id: 5, name: '中華' },
    { id: 6, name: 'カフェ' },
    { id: 7, name: '居酒屋' },
    { id: 8, name: 'ホテル・結婚式場' },
    { id: 9, name: '専門店（各国料理）' },
    { id: 10, name: 'その他' }
  ]

  include ActiveHash::Associations
  has_many :users
end
