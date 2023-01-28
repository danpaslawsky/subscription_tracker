class SubscriptionsController < ApplicationController
  before_action :require_login
  before_action :set_recipe, except: [:index, :new, :create]

  
  # show all subscriptions route: '/subscriptions' path: subscriptions_path
  def index
    if params[:user_id]
      @subscriptions = Subscription.user_subscription_index(current_user).list_by_amount
    else
      @subscriptions = Subscription.where(user: current_user).list_by_amount
    end
    render action: "index", layout: "create_new_subscription"
  end

  # render a new form route: '/subscriptions/new' path: new_subscription_path
  def new
    @subscription = Subscription.new(user_id: params[:user_id])
    @subscription.build_company

    render action: "new", layout: "all_users_subscriptions"
  end

  # process submitted new form route: '/subscriptions' POSTS to INDEX route path: subscriptions_path  -- only used on server side
  def create
    @subscription = current_user.subscriptions.build(subscription_params)
    if @subscription.save
      redirect_to user_subscription_path(current_user.username, @subscription)
    else
      #render preserves data to show user with hash of errors. redirect refreshes data
      render :new
    end
  end

  # render single subscription route: '/subscriptions/id' path: subscription_path(subscription_id)
  def show
    render action: "show", layout: "all_users_subscriptions"
  end

  def edit
  
  end

  def update
    @subscription.update(params[:subscription])
  end

  def destroy
    @subscription.destroy
    redirect_to user_subscriptions_path(current_user.username)
  end

private

  # permits fields being submited
  def subscription_params
    params.require(:subscription).permit(:amount_per_month, :type_of_subscription, :user_id, :company_id, company_attributes: [:name])
  end

   # query donation table and pass in id - find obj
  def set_recipe
    @subscription = Subscription.find_by_id(params[:id])
  end

end
