class VendorsController < ApplicationController

  def index
    @vendors = Vendor.all.sort_by {|vendor| vendor.deals.count}.reverse
    @vendor = Vendor.new
    @user = User.new
  end

  def new
    @vendor = Vendor.new
    if request.xhr?
      render(partial: 'new', object: @vendor)
    end
  end

  def create
    @vendor = Vendor.new(vendor_params)
    if @vendor.save
      session[:vendor_id] = @vendor.id
      redirect_to vendor_path(@vendor)
    else
      flash[:notice] = "There was a problem with your submission"
      redirect_to new_vendor_path
    end
  end

  def show
    @deal = Deal.new
    @vendor = Vendor.find(params[:id])
    @user = User.new
    @current_deals = @vendor.deals.where("end_time > ? AND item_quantity > ?", Time.now, 0).order(created_at: :desc)
    @last_five = @vendor.deals.limit(5)
  end

  def edit
    @vendor = Vendor.find(params[:id])
  end

  def update
    @vendor = Vendor.find(params[:id])
    @vendor.assign_attributes(vendor_params)
    if @vendor.save
      flash[:notice] = "Successfully edited account"
      redirect_to vendor_path(@vendor)
    else
      render :edit
    end
  end

  def destroy
    @vendor = Vendor.find(params[:id])
    @vendor.destroy
    session[:vendor_id] = nil
    redirect_to root_path
  end

  def send_sms
    @vendor = Vendor.find(params[:id])
    @vendor.send_followers_sms
    redirect_to vendor_path(@vendor.id)
  end

  def email_followers
    @vendor = Vendor.find(params[:id])
    @users = @vendor.users
    UserMailer.email_followers(@users.pluck(:email)).deliver
    redirect_to @vendor
  end

  def follow
    @vendor = Vendor.find(params[:vendor_id])
    @followers = @vendor.favorite_vendors
    unless @followers.exists?(user_id: params[:id])
      @vendor.favorite_vendors.create(user_id: params[:id])
      if request.xhr?
        return render :json => { :upvote => (@followers.count).to_s}
      end
    end
    return render :json => { :upvote => (@followers.count).to_s}
  end

  def unfollow
    @vendor = Vendor.find(params[:vendor_id])
    @followers = @vendor.favorite_vendors
    if @followers.exists?(user_id: params[:id])
      vote = @vendor.favorite_vendors.find_by(user_id: params[:id])
      vote.destroy
      if request.xhr?
        return render :json => { :downvote => (@followers.count).to_s}
      end
    end
    return render :json => { :downvote => (@followers.count).to_s}
  end

  # this is for index of Vendors followers
  def followers
    @vendor = Vendor.find(params[:id])
  end

  def stripe_acct
    response = Vendor.post_back(params[:code])
    response_hash = JSON.parse(response.body)
    current_vendor.update_attributes(access_token: response_hash["access_token"], livemode: response_hash["livemode"], refresh_token: response_hash["refresh_token"], token_type: response_hash["token_type"], stripe_publishable_key: response_hash["stripe_publishable_key"], stripe_user_id: response_hash["stripe_user_id"], scope: response_hash["scope"] )
    redirect_to vendor_path(current_vendor.id)
  end


  private

    def vendor_params
      params.fetch(:vendor, {}).permit(:username, :password, :email, :name, :address, :phone_number, :avatar, :password_confirmation)
    end

end
