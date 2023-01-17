class User < ApplicationRecord
  has_secure_password

  has_many :subscriptions
  has_many :companies, through: :subscriptions

  def companies_attributes=(companies_attributes) 
    companies_attributes.each do |company_attributes|
      self.companies.build(company_attributes)
    end
  end
end
