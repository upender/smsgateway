class UsersController < ApplicationController
  ######## For SMS Gateway ##############
  require 'net/http'
  require 'uri'
  ####################################
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_to @user, :notice => "Successfully created user."
    else
      render :action => 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      redirect_to @user, :notice  => "Successfully updated user."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_url, :notice => "Successfully destroyed user."
  end

  def send_sms
    @mobile_numbers = User.find(params[:user_ids]).map(&:mobile_number)
    message = "Hi this is test sms"
    url = "http://voice.full2ads.co.cc/api/sms.php?uid=6368616974616e7961&pin=4e4ce8b0a500c&sender=SARKCSC&route=1&mobile=#{@mobile_numbers.join(',')}&message=#{message}"
    Net::HTTP.get_print URI.parse(URI.encode(url.strip))
    redirect_to users_path,:notice => 'Sms send successfully...'
  end

=begin
  def sms_status
    mobile = @pancard.mobile
    #name = @pancard.first_name + @pancard.last_name
    message = "Dear Customer,Received amount of Rs."+@pancard.amount.to_s+"/- towards PAN Application.Your Reference No: "+@pancard.panapplication_number+"."
    url = "http://voice.full2ads.co.cc/api/sms.php?uid=6368616974616e7961&pin=4e4ce8b0a500c&sender=SARKCSC&route=1&mobile=#{mobile},9666138888&message=#{message}"
    Net::HTTP.get_print URI.parse(URI.encode(url.strip))
  end
=end
end
