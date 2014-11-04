require 'sellect/translate'

module Sellect::Translate

  if defined? Rails::Railtie
    require 'rails'

    # Load Gem before
    class Railtie < Rails::Railtie

      initializer 'sellect_translate.insert_into_active_record' do
        ActiveSupport.on_load :active_record do
          Sellect::Translate::Railtie.insert
        end
      end

      initializer 'activeservice.autoload', :before => :set_autoload_paths do |app|
        sellect_translate = File.expand_path('../../../../', __FILE__)
        app.config.autoload_paths += [
          File.join(sellect_translate, 'lib'),
          File.join(sellect_translate, 'app/models')
        ]
      end

    end
  end

  # Insert Gem Class Methods into ActiveRecord
  class Railtie
    def self.insert
      ActiveRecord::Base.send(:include, Sellect::Translate::Glue)
    end
  end

end