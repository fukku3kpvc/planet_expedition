class Galaxy < ApplicationRecord
  validates :title, presence: true, length: { in: 5..20 }
end
