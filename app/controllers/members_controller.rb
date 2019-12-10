class MembersController < ApplicationController
  before_action :get_exchange
  before_action :set_member, only: [:show, :edit, :update, :destroy, :confirm_membership]

  # GET /members
  # GET /members.json
  def index
    unless current_user.id == @exchange.user_id
      flash[:alert] = 'Access Restricted.'
      return redirect_to root_path
    end
    @members = @exchange.members
  end

  # GET /members/1
  # GET /members/1.json
  def show
  end

  # GET /members/new
  def new
    @member = @exchange.members.build
  end

  # GET /members/1/edit
  def edit
  end

  # POST /members
  # POST /members.json
  def create
    unless current_user.id == @exchange.user_id
      flash[:alert] = 'Access Restricted.'
      return redirect_to root_path
    end

    user_search = User.find_by({:email => member_params[:email]})
    @member = @exchange.members.build(member_params)
    @member.user=user_search if user_search

    if @member.save
      redirect_to exchange_members_path(@exchange), notice: 'Member was successfully created.'
    else
      render :new
    end
  end

  # DELETE /members/1
  # DELETE /members/1.json
  def destroy
    unless current_user.id == @exchange.user_id || current_user == @member.user
      flash[:alert] = 'Access Restricted.'
      return redirect_to root_path
    end
    if params[:root_redirect]
      @member.destroy
      redirect_to root_path 
    else
    @member.destroy
      redirect_to exchange_members_path(@exchange), notice: 'Member was successfully destroyed.'
    end
  end

  def confirm_membership
    unless current_user == @member.user
      flash[:alert] = 'Access Restricted.'
      return redirect_to root_path
    end
    @member.update_attributes(:confirmed => true)
    @member.save
    redirect_to root_path 
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def get_exchange
      @exchange = Exchange.find(params[:exchange_id])
    end

    def set_member
      @member = @exchange.members.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def member_params
      params.require(:member).permit(:email, :exchange_id, :confirmed, :gift_to, :gift_from)
    end
end
