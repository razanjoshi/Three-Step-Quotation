# frozen_string_literal: false

# Spec for Quote model
require 'rails_helper'
describe Quote, type: :model do
  describe '#current_step' do
    let(:quote) { Quote.new }
    subject(:quote_current_step) { quote.current_step }

    context 'when quote is on first step' do
      it 'returns user_details' do
        expect(quote_current_step).to eq("user_details")
      end
    end
  end

  describe '#last_step?' do
    let(:quote) { Quote.new }
    subject(:quote_last_step) { quote.last_step? }

    context 'when quote is on last step' do
      before do
        allow(quote).to receive(:current_step).and_return("confirmation")
      end
      it 'returns user_details' do
        expect(quote_last_step).to eq(true)
      end
    end
  end
end