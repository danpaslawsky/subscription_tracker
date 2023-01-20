class Subscription < ApplicationRecord
    belongs_to :user
    belongs_to :company

    accepts_nested_attributes_for :company
    
    validates :amount_per_month, presence: true, numericality: { only_integer: true }
    validates :type_of_subscription, presence: true
    # def companies_attributes=(companies_attributes) 
    #     companies_attributes.each do |company_attributes|
    #       self.companies.build(company_attributes)
    #     end
    # end

end
