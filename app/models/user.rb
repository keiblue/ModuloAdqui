class User < ApplicationRecord
  belongs_to  :role
  has_many :orders
  validates_uniqueness_of :rutito
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable

  if devise :registerable
    redirect_to root_path
  end
end
