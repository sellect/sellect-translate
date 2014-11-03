require 'rails/generators/migration'

module Sellect::Translate
  module Generators
    class InstallGenerator < ::Rails::Generators::Base
      include Rails::Generators::Migration

      source_root File.expand_path('../templates', __FILE__)
      
      desc "add migration"

      def self.next_migration_number(path)
        unless @prev_migration_nr
          @prev_migration_nr = Time.now.utc.strftime("%Y%m%d%H%M%S").to_i
        else
          @prev_migration_nr += 1
        end
        @prev_migration_nr.to_s
      end

      def copy_migrations
        migration_file = "create_sellect_translations.sellect.rb"
        if self.class.migration_exists?("db/migrate", migration_file)
          say_status("skipped", "Migration #{migration_file} already exists")
        else
          migration_template "create_sellect_translations.rb", "db/migrate/create_sellect_translations.sellect.rb"
        end
      end

    end
  end
end
