class Url < ApplicationRecord
  validates :long_url , uniqueness: true

  def shorten
    self.short_url = SecureRandom.hex(5)
  end
end
