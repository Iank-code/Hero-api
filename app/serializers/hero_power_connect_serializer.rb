class HeroPowerConnectSerializer < ActiveModel::Serializer
  attributes :id, :name, :super_name

  has_many :powers, through: :hero_powers
end
