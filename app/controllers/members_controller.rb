class MembersController < ApplicationController
  before_action :get_exchange
  before_action :set_member, only: [:show, :edit, :update, :destroy]

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
    @member = @exchange.members.build({:confirmed => false}.merge(member_params))

    respond_to do |format|
      if @member.save
        format.html { redirect_to exchange_members_path(@exchange), notice: 'Member was successfully created.' }
        format.json { render :show, status: :created, location: @member }
      else
        format.html { render :new }
        format.json { render json: @member.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /members/1
  # PATCH/PUT /members/1.json
  def update
    respond_to do |format|
      if @member.update(member_params)
        format.html { redirect_to exchange_members_path(@exchange), notice: 'Member was successfully updated.' }
        format.json { render :show, status: :ok, location: @member }
      else
        format.html { render :edit }
        format.json { render json: @member.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /members/1
  # DELETE /members/1.json
  def destroy
    unless current_user.id == @exchange.user_id
      flash[:alert] = 'Access Restricted.'
      return redirect_to root_path
    end
    @member.destroy
    respond_to do |format|
      format.html { redirect_to exchange_members_path(@exchange), notice: 'Member was successfully destroyed.' }
      format.json { head :no_content }
    end
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
      params.require(:member).permit(:email, :exchange_id)
    end
end
