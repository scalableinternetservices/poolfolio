class Holding < ApplicationRecord
    belongs_to :team
    validates :quantity, numericality: { greater_than_or_equal_to: 0 }
end
