class Studee < ActiveRecord::Base
  
  has_many :histories
  
  def recalculate_deposit
    absence = self.histories.pluck(:absence).inject(:+)
    late = self.histories.pluck(:late).inject(:+)
    homework = self.histories.pluck(:homework).inject(:+)
    voca = self.histories.pluck(:voca).inject(:+)
  end
end
