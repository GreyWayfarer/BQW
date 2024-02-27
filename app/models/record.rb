class Record < ApplicationRecord
    serialize :json_data
    validates :cadnumber, presence: true, uniqueness: true, format: { with: /\d{2}[:]\d{2}[:]\d{6,7}:\d+\z/, message: "must be a valid" }
end
