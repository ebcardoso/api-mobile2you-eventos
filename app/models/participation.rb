class Participation < ApplicationRecord
    belongs_to :event
    belongs_to :user
    has_one    :prize
end
