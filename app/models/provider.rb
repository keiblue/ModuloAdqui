class Provider < ApplicationRecord
    has_many :orders
    has_many :items
    belongs_to :agreement
    belongs_to  :address
    belongs_to :service
    validates_uniqueness_of :rut

    before_validation :validate_rut, on: :create
    before_validation :validate_rut, on: :update

    def validate_rut
        rut = self.rut
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
 
          if sub_dv == 11 && self.rut_dv.to_i == 0    
          elsif sub_dv == 10 && self.rut_dv == 'k' 
          elsif (sub_dv >= 1 &&  sub_dv <= 9) && self.rut_dv.to_i == sub_dv  
          else
            errors.add('rut', "no es un rut valido")
          end
        end
end
