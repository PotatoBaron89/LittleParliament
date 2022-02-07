class CreateApiV1Drinks < ActiveRecord::Migration[6.1]
  def change
    create_table :api_v1_drinks do |t|

      t.timestamps
    end
  end
end
