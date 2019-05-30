class Item < ApplicationRecord
    belongs_to :provider
    has_many :details
    has_many :orders , through: :details

end
