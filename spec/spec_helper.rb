require 'protected_attributes'
require 'rails/all'
require 'active_record'
require 'sellect/translate/railtie'
require File.join(Dir.pwd, 'app/models/sellect/translation')
Sellect::Translate::Railtie.insert

ActiveRecord::Base.establish_connection(adapter: "sqlite3", database: ":memory:")

I18n.enforce_available_locales = false

RSpec.configure do |config|

  config.before(:all) do
    m = ActiveRecord::Migration.new
    m.verbose = false  
    m.create_table :dummies do |t| 
      t.string :name
      t.string :description
    end
    m.create_table :sellect_translations do |t|
      t.string     :locale
      t.text       :params
      t.references :translatable, polymorphic: true
      t.timestamps
    end
  end

  config.after(:all) do
    m = ActiveRecord::Migration.new
    m.verbose = false
    m.drop_table :dummies
    m.drop_table :sellect_translations
  end

end


def build_class(class_name, options = {})
  ActiveRecord::Base.send(:include, Sellect::Translate::Glue)
  Object.send(:remove_const, class_name) rescue nil

  # Set class as a constant
  klass = Object.const_set(class_name, Class.new(ActiveRecord::Base))

  # Setup class with paperclip and delayed paperclip
  klass.class_eval do
    include Sellect::Translate::Glue

    translate_fields :name, :description 

    attr_accessible :name, :description

  end
  
  klass
end