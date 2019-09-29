class SubscribersController < ApplicationController
  before_action :set_subscriber, only: [:show]



  # GET /subscribers/new
  def new
    @subscriber = Subscriber.new
  end

  # POST /subscribers
  # POST /subscribers.json
  def create
    attr_with_defaults = {:subscribed => true, :type_of_sub=> "FrontPage Subscriber"}.merge(subscriber_params)
    @subscriber = Subscriber.find_by(attr_with_defaults)
    
    if @subscriber
      redirect_to root_path, notice: @subscriber.sub_email + ' is already a Subscriber'
    else

      @subscriber = Subscriber.new(attr_with_defaults)
      if @subscriber.save
        redirect_to @subscriber, notice: 'Subscriber was successfully created.'
      else
        render :new
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_subscriber
      @subscriber = Subscriber.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def subscriber_params
      params.require(:subscriber).permit(:sub_email,:type_of_sub,:subscribed)
    end
end
