class Admin::OperatorController < Admin::ApplicationController
  before_action do
    flash[:info] = 'this is test1'
  end

  def resource_params
    params.require(:operator).permit(:email, :type, :password, :password_confirmation)
  end
end
