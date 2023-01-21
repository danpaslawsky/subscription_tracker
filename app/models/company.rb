class Company < ApplicationRecord
    has_many :subscriptions
    has_many :users, through: :subscriptions

    validates :name, presence: true

    scope :list_aplha, -> {joins(:subscriptions).group('companies.name').order('LOWER(name)')}

end
