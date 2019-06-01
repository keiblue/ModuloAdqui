class Order < ApplicationRecord
    belongs_to  :user
    belongs_to :provider
    belongs_to :status
    belongs_to :store
    has_many :details
    has_many :items , through: :details
    has_one :payment

    after_create :save_items
    after_update :update_items

    #custom setter
    def items=(items)
        @items = items
    end

    def save_items
        @items.each do |item_id|
            Detail.create(order_id: self.id, item_id: item_id , count: 3)
        end
    end

    def update_items
        items = Detail.where(order_id: self.id)
        items.each do |i|
            i.destroy
        end 
        self.save_items
    end
end
