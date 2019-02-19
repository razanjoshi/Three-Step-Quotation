# frozen_string_literal: false

# Spec for Quote controller
require 'rails_helper'
describe QuotesController, type: :controller do
  context "GET new" do

    it "assigns a quote to the view" do
      get :new
      expect(assigns(:quote)).to be_a_new(Quote)
    end
  end
end
