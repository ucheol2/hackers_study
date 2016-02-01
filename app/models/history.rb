class History < ActiveRecord::Base
  belongs_to :studee
  
  def get_fine
    return self.absence*2000 + late*500 + homework*1000 + voca*100
  end
end
