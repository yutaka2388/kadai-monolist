class Want < Ownership
    def self.wantranking
    self.group(:item_id).order('count_item_id DESC').limit(10).count(:item_id)
    end

end
