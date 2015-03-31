module Sellect::Translate
  module InstanceMethods

    def current_locale
      Sellect::Translate.locale
    end

  end
end