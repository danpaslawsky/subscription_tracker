class Subscription < ApplicationRecord
    belongs_to :user
    belongs_to :company

    
    validates :amount_per_month, presence: true, numericality: { only_integer: true }
    validates :type_of_subscription, presence: true

    def company_attributes=(company_attributes) 
        if !self.company_id
            self.company = Company.find_or_create_by(company_attributes)
        end
    end
end
