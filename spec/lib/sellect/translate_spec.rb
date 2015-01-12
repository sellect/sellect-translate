require 'spec_helper'

describe Sellect::Translate do

  describe '.locale' do
    it 'returns the I18n locale' do
      expect(Sellect::Translate.locale).to eq(I18n.locale)
    end
  end

  describe '.default_locale' do
    it 'returns the I18n default locale' do
      expect(Sellect::Translate.default_locale).to eq(I18n.default_locale)
    end
  end

end
