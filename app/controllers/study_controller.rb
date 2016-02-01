class StudyController < ApplicationController
  def index
    @studees = Studee.all
  end
  
  def fine_proc
    studee = Studee.find(params[:studee].to_i)
    absence = params[:absence].to_i
    late = params[:late].to_i
    homework = params[:homework].to_i
    voca = params[:voca].to_i
    new_his = History.create(studee: studee, absence: absence, late: late, homework: homework, voca: voca)
    studee.update(deposit: studee.deposit - new_his.get_fine, absence: studee.absence + absence, late: studee.late + late, homework: studee.homework + homework, voca: studee.voca + voca)
    
    respond_to do |format|
      format.json { render json: {id: studee.id, deposit: studee.deposit, his: new_his, fine: new_his.get_fine}}
    end
  end
  
  def cancle_history
    if params[:password] == "0201"
      history = History.find(params[:history_id].to_i)
      studee = history.studee
      studee.update(deposit: studee.deposit + history.get_fine, absence: studee.absence - history.absence, late: studee.late - history.late, homework: studee.homework - history.homework, voca: studee.voca - history.voca)
      history.destroy
    end
    redirect_to :back
  end
end
