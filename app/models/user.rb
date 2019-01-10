class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum role: %I[cosmonaut commandor]

  belongs_to :expedition, optional: true
  accepts_nested_attributes_for :expedition
end
