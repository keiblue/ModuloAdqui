class User < ApplicationRecord
  belongs_to  :role
  has_many :orders
  validates_uniqueness_of :rutito
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,:registerable,
         :recoverable, :rememberable, :validatable
 before_destroy :update_orders

before_validation :validate_rut, on: :create
before_validation :validate_rut, on: :update
  
  def update_orders
    orders = Order.where(user_id: self.id)
    orders.each do |order|
      order.update(user_id: 1)
    end
  end

  def validate_rut
    rut = self.rutito
    rut = rut.to_s
    rut = rut.reverse
    @total = 0
    rut.each_char.with_index do |n , i|
      if i <=5 
       a= n.to_i*(i+2)
       @total += a
      elsif i >= 6
        b= n.to_i*(i-4)
        @total += b
      end
    end
      sub_dv = 11-(@total%11)
      if sub_dv == 11 && self.rutito_dv.to_i == 0
      elsif sub_dv == 10 && self.rutito_dv == 'k'
      elsif (sub_dv >= 1 &&  sub_dv <= 9) && self.rutito_dv.to_i == sub_dv 
      else
        errors.add('rut', "no es un rut valido")
      end
    end

 


end
