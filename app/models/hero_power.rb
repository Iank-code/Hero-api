class HeroPower < ApplicationRecord
  belongs_to :power
  belongs_to :hero

  enum :strength, [:STRONG, :WEAK, :AVERAGE]
end
