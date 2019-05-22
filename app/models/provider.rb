class Provider < ApplicationRecord
    has_many :orders
    belongs_to :agreement
    belongs_to  :address
    belongs_to :service
    validates_uniqueness_of :rut
end
