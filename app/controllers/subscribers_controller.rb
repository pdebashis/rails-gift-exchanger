class SubscribersController < ApplicationController

  def index
    redirect_to root_path
  end
  # GET /subscribers/new
  def new
    @subscriber = Subscriber.new
  end

  # POST /subscribers
  # POST /subscribers.json
  def create
    attr_with_defaults = {:subscribed => true, :type_of_sub=> "FrontPage Subscriber"}.merge(subscriber_params)
    @subscriber = Subscriber.find_by(subscriber_params)

    if @subscriber
      redirect_to root_path, notice: @subscriber.sub_email + ' is already a Subscriber'
    else

      @subscriber = Subscriber.new(attr_with_defaults)
      if @subscriber.save
        @unsubscribe = Rails.application.message_verifier(:unsubscribe).generate(@subscriber.id)
        SubscriberMailer.subscription_confirmation(@subscriber,@unsubscribe).deliver_now
        redirect_to root_path, notice: @subscriber.sub_email + ' has been successfully added to our mailing list.'
      else
        render :new
      end
    end
  end

  def update
    @subscriber = Subscriber.find(params[:id])
    if @subscriber.update(subscriber_params)
      flash[:notice] = 'Subscription Cancelled' 
      redirect_to root_url
    else
      flash[:alert] = 'There was a problem'
      render :show
    end
  end

  def show
    subscriber = Rails.application.message_verifier(:unsubscribe).verify(params[:id])
    @subscriber = Subscriber.find(subscriber)
  end


  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def subscriber_params
      params.require(:subscriber).permit(:sub_email,:type_of_sub,:subscribed)
    end
end
