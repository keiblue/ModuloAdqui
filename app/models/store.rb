class Store < ApplicationRecord
    has_many :orders
    belongs_to  :address
    has_many :inventaries
end
