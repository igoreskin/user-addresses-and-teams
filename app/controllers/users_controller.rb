class UsersController < ApplicationController

  def new
    @user = User.new
    @user.addresses.build(address_type: "Home")
    @user.addresses.build(address_type: "Business")
    @user.build_team
  end

  def create
    @user= User.new(user_params)
    if @user.save
      redirect_to @user
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
    @addresses = @user.addresses
    @team = @user.team 
  end


  private

  def user_params
    params.require(:user).permit(
      :email,
      addresses_attributes:[:street_1, :street_2, :address_type],
      team_attributes:[:name, :hometown]
    )
  end

end
