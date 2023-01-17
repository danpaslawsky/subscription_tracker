class Subscription < ApplicationRecord
    belongs_to :user
    belongs_to :company

    def companies_attributes=(companies_attributes) 
        companies_attributes.each do |company_attributes|
          self.companies.build(company_attributes)
        end
    end
    
end
