class Patient < ApplicationRecord
    has_many :appointments
    has_many :physicians, through: :appointments

    validates :name, presence: true
    validates :email, presence: true, uniqueness: true
end
