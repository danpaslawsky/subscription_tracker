class Subscription < ApplicationRecord
    belongs_to :user, optional: true
    belongs_to :company

    
    validates :amount_per_month, presence: true, numericality: { only_integer: true }
    validates :type_of_subscription, presence: true

    def company_attributes=(company_attributes) 
        if !self.company_id
            self.company = Company.find_or_create_by(company_attributes)
        end
    end

    scope :list, -> {joins(:company).group('subscriptions.amount_per_month').order('amount_per_month')}

end
