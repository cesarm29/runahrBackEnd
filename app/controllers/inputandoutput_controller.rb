class InputandoutputController < ApplicationController
#validation before the action
before_action :set_inputandoutput, only: [:show, :update, :destroy] 
before_action :authenticate_request!, :except => [:index ]
# show input or output
def index 
  @inputandoutput = Inputandoutput.all  
  if @inputandoutput.present?
    render json: @inputandoutput
  else
    render json: {status: 'Error in load'}, status: :not_found
  end
end
# show all users and inputandoutputs for id join
def get
  @inputandoutput = Inputandoutput.joins("INNER JOIN users  ON inputandoutputs.user_id = users.id ").select("users.*,inputandoutputs.*")
  if @inputandoutput.present?
    render json: @inputandoutput
  else
    render json: {status: 'Error in load'}, status: :not_found
  end
end
#show one users and inputandouputs where id
def getId
  @inputandoutput = Inputandoutput.joins("INNER JOIN users  ON inputandoutputs.user_id = users.id ").select("users.*,inputandoutputs.*").where("users.id=?", params[:id])
  if @inputandoutput.present?
    render json: @inputandoutput
  else
    render json: {status: 'Error in load'}, status: :not_found
  end
end
# show input or output for id
def show
  inputandoutput = Inputandoutput.find(params[:id])
  if inputandoutput.present?
    render json: {status: 'SUCCESS', message:'Loaded Data', data:inputandoutput},status: :ok
  else
    render json: {status: 'Error in load'}, status: :not_found
  end
end
# create input or output
def create
  #validation data present into bd for date,user_id,observation
  inputandoutput = Inputandoutput.where("DATE(date)=? AND user_id=? AND observation=? ", Date.today, params[:user_id], params[:observation])
  if inputandoutput.present?
    render json: { status: 'Error the entry or exit was already registered for this user' }, status: :bad_request
  else
    inputandoutput = Inputandoutput.new(inputandoutput_params)
    if inputandoutput.save
        render json: {status: 'Input or Output created successfully'}, status: :created
    else
        render json: { status: 'Error created input or output' }, status: :bad_request
    end
  end  
end
# update input or output
def update
  inputandoutput = Inputandoutput.find_by(params[:id])
  if inputandoutput.update_attributes(inputandoutput_params)
    render json: {status: 'SUCCESS', message:'Updated input or output', data:inputandoutput},status: :ok
  else
    render json: {status: 'ERROR', message:'Error input or output not updated', data:inputandoutput.errors},status: :unprocessable_entity
  end
end 
# destroy input or output
def destroy
  inputandoutput = Inputandoutput.find(params[:id])
  if inputandoutput.present?
    inputandoutput.destroy
    render json: {status: 'SUCCESS', message:'Deleted input or output', data:inputandoutput},status: :ok
  else
    render json: {status: 'Error deleted input or output'}, status: :not_found
  end
end
private
# Use callbacks to share common setup or constraints between actions.
def set_inputandoutput 
  inputandoutput = Inputandoutput.find(params[:id]) 
 end 
# params 
def inputandoutput_params
    params.permit( :id, :date, :observation, :user_id, :role)
end
#end  
end
