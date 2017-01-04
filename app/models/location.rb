class Location < ActiveRecord::Base
    geocoded_by :address
    after_validation :geocode, if: :address_changed?
    validates :address, presence: true
    after_validation :lat_changed?
    
    private
    def lat_changed?
    if (self.address_changed?)
        if !(self.latitude_changed?)
            self.errors.add(:address, "is not valid")
            return false
        end
    end
    return true
end
end
