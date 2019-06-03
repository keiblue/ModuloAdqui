class Item < ApplicationRecord
    belongs_to :provider
    has_many :details
    has_many :orders , through: :details
    
    before_destroy: :delete_detail
    
    def delete_detail
        detail = Detail.where(item_id: self.id)
        detail.each do |dt|
            dt.destroy
        end
    end
    
end
