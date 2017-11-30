class User < ApplicationRecord

  has_many :addresses
  belongs_to :team

  def addresses_attributes=(addresses_attributes)
    addresses_attributes.each do |i, address_attributes|
    # or addresses_attributes.values.each do |address_attributes| because it's a hash
      self.addresses.build(address_attributes)
    end
  end

  def team_name=(team_name)
    self.team = Team.find_by(name: name)
  end

  def team_attributes=(team_attributes)
    self.build_team(team_attributes)
  end

  # def team_attributes=(team_attributes)
  #   self.team = Team.where(name: team_attributes[:name]).first_or_create do |t|
  #     t.hometown = team_attributes[:hometown]
  #   end
  # end

end
