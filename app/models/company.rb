class Company < ApplicationRecord
    has_many :subscriptions
    has_many :users, through: :subscriptions

    validates :name, presence: true


    # Scope method that organizes subscriptions by their companies 
    


end
