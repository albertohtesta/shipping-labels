class Shipping < ApplicationRecord
  belongs_to :carrier
  belongs_to :solicitude
end
