class CreateCryptograms < ActiveRecord::Migration[6.0]
  def up
    enable_extension 'hstore' unless extension_enabled?('hstore')
    create_table :cryptograms do |t|
      t.string :identifier
      t.string :cryptogram
      t.hstore :cipher

      t.timestamps
    end
    add_index :cryptograms, :identifier
  end

  def down
    disable_extension 'hstore' if extension_enabled?('hstore')
    drop_table :cryptograms
  end
end
