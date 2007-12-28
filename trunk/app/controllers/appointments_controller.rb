class AppointmentsController < ApplicationController
  def index
    list
    render :action => 'list'
  end

  verify :method => :post, :only => [ :destroy, :create, :update ],
         :redirect_to => { :action => :list }

  def list
    if params[:client] then
      @appointments = Appointment.find_all_by_client_id(params[:client], :conditions => "occurs_on >= '#{Date.today}'")
    else
      @appointments = Appointment.find(:all, :conditions => "occurs_on >= '#{Date.today}'")
    end
  end

  def show
    @appointment = Appointment.find(params[:id])
  end

  def new
    @appointment = Appointment.new
  end

  def create
    @appointment = Appointment.new(params[:appointment])
    @appointment.client = Client.find(params[:client]['client_id'])
    if @appointment.save
      flash[:notice] = 'Appointment was successfully created.'
      redirect_to :action => 'list'
    else
      render :action => 'new'
    end
  end

  def edit
    @appointment = Appointment.find(params[:id])
  end

  def update
    client = Client.find(params[:client]['client_id'])
    @appointment = Appointment.find(params[:id])
    params[:appointment]['client'] = client
    if @appointment.update_attributes(params[:appointment])
      flash[:notice] = 'Appointment was successfully updated.'
      redirect_to :action => 'list'
    else
      render :action => 'edit'
    end
  end

  def destroy
    Appointment.find(params[:id]).destroy
    redirect_to :action => 'list'
  end
end
