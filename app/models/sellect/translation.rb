module Sellect
  class Translation < ActiveRecord::Base
    self.table_name = 'sellect_translations'
    belongs_to :translatable, polymorphic: true

    attr_accessible :translation, :translation_type, :translation_id, 
                    :params, :locale

    serialize :params
  end
end