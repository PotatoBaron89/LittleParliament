class CreateApiV1Foods < ActiveRecord::Migration[6.1]
  def change
    create_table :api_v1_foods do |t|

      t.timestamps
    end
  end
end
