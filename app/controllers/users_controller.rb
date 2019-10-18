class UsersController < Clearance::UsersController
  before_action :set_user, only: [:edit, :update]

  def edit
  	@user
  end

  def update
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

  def set_user
    @user = User.find(params[:id])
  end

end