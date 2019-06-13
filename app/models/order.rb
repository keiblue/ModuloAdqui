class Order < ApplicationRecord
    belongs_to  :user
    belongs_to :provider
    belongs_to :status
    belongs_to :store
    has_many :details
    has_many :items , through: :details
    belongs_to :payment
    
    

    after_create :save_items
    after_update :update_items
    after_destroy :destroy_detail
    #custom setter
    def items=(items)
        @items = items
        puts @items
    end
    def items_counts=(counts)
        @counts = counts  
        puts @counts
    end

    def save_items
        unless @items.nil?
            count = @counts.reject(&:blank?)
            @items.each_with_index do |item_id, index|
                item = Item.find(item_id)
                provider_id = item.provider.id
                if provider_id == self.provider.id
                    unless item_id == 0 
                    Detail.create(order_id: self.id, item_id: item_id ,count: count[index] )
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
end
