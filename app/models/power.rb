class Power < ApplicationRecord
    has_many :hero_powers
    has_many :heros, through: :hero_powers

    validates :description, {
        length: {minimum: 20},
        presence: true
    }

    validates :name, {
        presence: true
    }
end
