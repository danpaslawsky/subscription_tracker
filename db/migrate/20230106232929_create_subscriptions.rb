class CreateSubscriptions < ActiveRecord::Migration[6.0]
  def change
    create_table :subscriptions do |t|
      t.float :amount
      t.datetime :due_date
      belongs_to :user
      belongs_to :company

      t.timestamps
    end
  end
end
