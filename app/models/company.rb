class Company < ApplicationRecord
    has_many :subscriptions
    has_many :users, through: :subscriptions

    validates :name, presence: true


end
