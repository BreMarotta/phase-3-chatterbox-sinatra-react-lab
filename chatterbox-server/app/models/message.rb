class Message < ActiveRecord::Base 

    def self.created_at_order 
        self.all.order(created_at: :asc)
    end
end