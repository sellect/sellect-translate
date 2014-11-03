require 'rails/engine'

module Sellect::Translate
  class Engine < ::Rails::Engine

    config.autoload_paths += [
      config.root.join('lib'),
      config.root.join('app/models')
    ]
  end
end