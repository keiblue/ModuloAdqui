class User < ApplicationRecord
  belongs_to  :role
  has_many :orders
  validates_uniqueness_of :rutito
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,:registerable,
         :recoverable, :rememberable, :validatable
 before_destroy :update_orders
  
  def update_orders
    orders = Order.where(user_id: self.id)
    orders.each do |order|
      order.update(user_id: 1)
    end
  end
end
