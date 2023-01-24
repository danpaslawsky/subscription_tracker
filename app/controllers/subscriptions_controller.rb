class SubscriptionsController < ApplicationController
  before_action :require_login

  
  # show all subscriptions route: '/subscriptions' path: subscriptions_path
  def index
    if params[:user_id]
      @subscriptions = Subscription.user_subscription_index(current_user).list_by_amount
      #@subscriptions = User.find_by(params[:user_id]).subscriptions.list_by_amount
      # @user = User.find_by(params[:user_id])
      # @subscriptions = @User.subscriptions
    else
      @subscriptions = Subscription.where(user: current_user).list_by_amount
    end
  end

  # render a new form route: '/subscriptions/new' path: new_subscription_path
  def new
    @subscription = Subscription.new(user_id: params[:user_id])
    @subscription.build_company
  end

  # process submitted new form route: '/subscriptions' POSTS to INDEX route path: subscriptions_path  -- only used on server side
  def create
    @subscription = current_user.subscriptions.build(subscription_params)
    if @subscription.save
      redirect_to user_subscription_path(:user_id, @subscription)
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
    #binding.pry
    @subscription = Subscription.find_by_id(params[:id])
    @subscription.destroy
    redirect_to user_subscriptions_path(:user_id)
  end

  private

  # permits fields being submited
  def subscription_params
    params.require(:subscription).permit(:amount_per_month, :type_of_subscription, :company_id, company_attributes: [:name])
  end

  # def redirect_if_not_authorized
  #   if @subscription.user != current_user
  #       flash[:error] = "You can't make this edit, you are not the owner of this account"
  #       redirect_to subscription_path
  #   end    
  # end

end
