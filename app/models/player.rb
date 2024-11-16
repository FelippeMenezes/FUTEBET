class Player < ApplicationRecord
  belongs_to :team, optional:true
  
  def transfer_to(new_team)
    self.team = new_team
    save
  end
end
