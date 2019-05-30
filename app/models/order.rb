class Order < ApplicationRecord
    belongs_to  :user
    belongs_to :provider
    belongs_to :status
    belongs_to :store

    has_many :details
    has_many :items , through: :details
end
