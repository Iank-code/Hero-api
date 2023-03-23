class HeroPowerSerializer < ActiveModel::Serializer
  attributes :id, :name, :super_name

  has_many :hero_powers
  # has_many :powers through: :hero_powers
end
