class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true
  validates :password, presence: true,format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i }
  
  has_many :events
end
