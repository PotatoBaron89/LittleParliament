class CreateApiV1Products < ActiveRecord::Migration[6.1]
  def change
    create_table :api_v1_products do |t|

      t.timestamps
    end
  end
end
