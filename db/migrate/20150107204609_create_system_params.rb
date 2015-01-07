class CreateSystemParams < ActiveRecord::Migration
  def change
    create_table :system_params do |t|
      t.text :name
      t.text :code, null:false, unique:true
      t.text :value
      t.timestamp :expires_at
      t.timestamps
    end

    add_index :system_params, :code
  end
end
