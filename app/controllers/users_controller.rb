class UsersController < Clearance::UsersController

  def edit
  	@user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update_attributes(user_params)
      redirect_to root_path, notice: 'User was successfully updated'
    else
        render action: "edit"
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end

end