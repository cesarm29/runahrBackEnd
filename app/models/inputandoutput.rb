class Inputandoutput < ApplicationRecord
    # validate params
    validates_presence_of :date
    validates_presence_of :observation
    validates_presence_of :user_id
    # date 
    def obtain_date
        Date.today
    end  
end
