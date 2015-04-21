require 'rails_helper'

RSpec.describe VenuesSearcher do
  context '#new' do
    it 'accepts a couple of String' do
      expect(VenuesSearcher.new('12.442', '-32.4235')).to be_a(VenuesSearcher)
    end

    it 'does not accept just one String' do
      expect { VenuesSearcher.new('Rome, RM') }.to raise_error(ArgumentError)
    end
  end
end
