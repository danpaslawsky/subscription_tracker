class CreateSubscriptions < ActiveRecord::Migration[6.0]
  def change
    create_table :subscriptions do |t|
      t.integer :amount_per_month
      t.belongs_to :company
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
