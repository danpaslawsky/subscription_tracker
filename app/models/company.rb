class Company < ApplicationRecord
    has_many :subscriptions
    has_many :Users, through: :subscriptions
end
