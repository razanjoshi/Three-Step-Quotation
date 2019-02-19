# frozen_string_literal: true

# rubocop:disable Metrics/BlockLength
FactoryBot.define do
    factory :quote do
        id { rand(10000) }
        user_email { 'foo@bar.com' }
        user_name { 'foo bar'}
        user_phone { '45678905678'}
    end
end
