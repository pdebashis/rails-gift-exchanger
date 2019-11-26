class ExchangesController < ApplicationController
  before_action :require_login
  before_action :set_exchange, only: [:show, :edit, :update, :destroy]

  # GET /exchanges
  # GET /exchanges.json
  def index
    @exchanges = Exchange.all
  end

  # GET /exchanges/1
  # GET /exchanges/1.json
  def show
  end

  # GET /exchanges/new
  def new
    @exchange = Exchange.new
  end

  # GET /exchanges/1/edit
  def edit
    unless current_user.id == @exchange.user_id
      flash[:alert] = 'Access Restricted.'
      return redirect_to root_path
    end
  end

  # POST /exchanges
  # POST /exchanges.json
  def create
    exchange_params_with_user = {:user_id => current_user.id}.merge(exchange_params)
    @exchange = Exchange.new(exchange_params_with_user)

    respond_to do |format|
      if @exchange.save
        format.html { redirect_to @exchange, notice: 'Exchange was successfully created.' }
        format.json { render :show, status: :created, location: @exchange }
      else
        format.html { render :new }
        format.json { render json: @exchange.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /exchanges/1
  # PATCH/PUT /exchanges/1.json
  def update
    unless current_user.id == @exchange.user_id
      flash[:alert] = 'Access Restricted.'
      return redirect_to root_path
    end

    if @exchange.update(exchange_params)
      redirect_to @exchange, notice: 'Exchange was successfully updated.'
    else
      render :edit 
    end
  end

  # DELETE /exchanges/1
  # DELETE /exchanges/1.json
  def destroy
    unless current_user.id == @exchange.user_id
      flash[:alert] = 'Access Restricted.'
      return redirect_to root_path
    end

    @exchange.destroy
    respond_to do |format|
      format.html { redirect_to exchanges_url, notice: 'Exchange was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_exchange
      @exchange = Exchange.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def exchange_params
      params.require(:exchange).permit(:title, :date_of_gifting, :finish_date, :date_of_matching, :user_id)
    end
end
