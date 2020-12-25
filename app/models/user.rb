class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :genre
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :recipes, dependent: :destroy
  has_many :comments
  has_one_attached :image
  has_many :likes, dependent: :destroy
  has_many :liked_recipes, through: :likes, source: :recipe

  def already_liked?(recipe)
    self.likes.exists?(recipe_id: recipe.id)
  end

  with_options presence: true do
    validates :image
    validates :name
    validates :genre_id
    validates :restaurant
    validates :career
  end
  validates :genre_id, numericality: { other_than: 1 }
end
