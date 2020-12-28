class Recipe < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_one_attached :image
  has_many :likes, dependent: :destroy
  has_many :liked_users, through: :likes, source: :user
  
  def self.search(search)
    if search != ""
      Recipe.where('menu_name LIKE(?)', "%#{search}%")
    else
      Recipe.all
    end
  end

  with_options presence: true do
    validates :menu_name
    validates :material
    validates :process
    validates :image
    validates :point
    validates :time
  end
end

