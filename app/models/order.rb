class Order < ApplicationRecord
    belongs_to  :user
    belongs_to :provider
    belongs_to :status
    belongs_to :store
end
