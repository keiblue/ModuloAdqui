class OrderHistory < ApplicationRecord
    has_one :user
    has_one :order
    has_one :status
end
