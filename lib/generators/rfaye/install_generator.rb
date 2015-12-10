module Rfaye
  module Generators
    class InstallGenerator < Rails::Generators::Base
      def self.source_root
        File.dirname(__FILE__) + "/templates"
      end
      def copy_files
        template "rfaye.yml", "config/rfaye.yml"
        copy_file "rfaye.ru", "rfaye.ru"
        copy_file "rfaye_load.rb", "config/initializers/rfaye_load.rb"
      end
    end
  end
end