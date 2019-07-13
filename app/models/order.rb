class Order < ApplicationRecord
    belongs_to  :user
    belongs_to :provider
    belongs_to :status
    belongs_to :store
    has_many :details
    has_many :items , through: :details
    belongs_to :payment
    has_many :order_histories
    
    

    after_create :save_items, :save_history
    after_update :update_items, :update_history
    after_destroy :destroy_detail
    #custom setter
    def items=(items)
        @items = items
        #puts @items
    end
    def new_order=()
        return 3
    end
    def items_counts=(counts)
        @counts = counts  
    end

    def save_items
        unless @items.nil?
            @items.each do |item_id|
                unless item_id["id"] == '0'
                    item = Item.find(item_id["id"])
                    provider_id = item.provider.id
                    if provider_id == self.provider.id
                        unless item_id["cant"] == '0' || item_id["cant"].nil? || item_id["cant"].blank?
                            puts  item_id["cant"]
                            Detail.create(order_id: self.id, item_id: item_id["id"] ,count: item_id["cant"] )
                        end
                    end
                end
            end            
        end

    end
    
    def destroy_detail
        detail = Detail.where(order_id: self.id)
        detail.each do|det|
            det.destroy
        end
    end

    def update_items
        self.destroy_detail
        self.save_items
    end

    def save_history
        OrderHistory.create(user_id: self.user_id , orden_id: self.id , status_id: self.status_id
        )
    end

    def update_history
        self.save_history
    end
end
