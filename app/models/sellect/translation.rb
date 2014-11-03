module Sellect
  class Translation < ActiveRecord::Base
    belongs_to :translatable, polymorphic: true

    attr_accessible :translation, :translation_type, :translation_id

    serialize :params
  end
end