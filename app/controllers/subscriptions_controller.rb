class SubscriptionsController < ApplicationController
  
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
    byebug
  end

  def show
  end

  def edit
  end

  def destroy
  end

end
