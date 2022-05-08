class Physician < ApplicationRecord
    has_many :appointments
    has_many :patients, through: :appointments

    validates :name, presence: true
    validates :email, presence: true, uniqueness: true

    before_create :assign_unique_id

    private
        def assign_unique_id
            while true
                u_id = SecureRandom.alphanumeric
                if Physician.where(unique_id: u_id).length == 0
                    self.unique_id = u_id
                    break
                end
            end
        end
end
