class SubscriptionsController < ApplicationController
  before_action :require_login
  # show all subscriptions route: '/subscriptions' path: subscriptions_path
  def index
    @subscriptions = Subscription.all
  end

  # render a new form route: '/subscriptions/new' path: new_subscription_path
  def new
    @subscription = Subscription.new
  end

  # process submitted new form route: '/subscriptions' POSTS to INDEX route path: subscriptions_path  -- only used on server side
  def create
    @subscription = Subscription.new(subscription_params)
    # @subscription = current_user.subscription.build(subscription_params)
    if @subscription.save
      redirect_to subscription_path(@subscription)
    else
      #render preserves data to show user with hash of errors. redirect refreshes data
      render :new
    end
  end

  # render single subscription route: '/subscriptions/id' path: subscription_path(subscription_id)
  def show
    # query donation table and pass in id - find obj
    @subscription = Subscription.find_by_id(params[:id])
  end

  def edit
    @subscription = Subscription.find_by_id(params[:id])
  end

  def update
    @subscription = Subscription.find_by_id(params[:id])
    @subscription.update(params[:subscription])
  end

  def destroy
    @subscription = Subscription.find_by_id(params[:id])
    @subscription.destroy
    redirect_to subscriptions_path
  end

  private

  # permits fields being submited
  def subscription_params
    params.require(:subscription).permit(:amount, :due_date, :user_id, :company_id)
  end

  # def redirect_if_not_authorized
  #   if @subscription.user != current_user
  #       flash[:error] = "You can't make this edit, you are not the owner of this account"
  #       redirect_to subscription_path
  #   end    
  # end

end
