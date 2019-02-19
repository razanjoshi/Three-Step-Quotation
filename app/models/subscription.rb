class Subscription < ApplicationRecord
    belongs_to :quote

    DAILY_RATE = 15
end
