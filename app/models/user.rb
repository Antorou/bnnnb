class User < ApplicationRecord
  has_many :rooms
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
