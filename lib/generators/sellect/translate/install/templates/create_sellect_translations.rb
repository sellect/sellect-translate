class CreateSellectTranslations < ActiveRecord::Migration
  def self.up
    create_table :sellect_translations do |t|
      t.string     :locale
      t.text       :params
      t.references :translatable, polymorphic: true
      t.timestamps
    end
  end

  def self.down
    drop_table :sellect_translations
  end
end