class Admin::OperatorController < Admin::ApplicationController
  before_action do
    flash[:info] = 'This is a test flash message.'
  end

  def resource_params
    params.require(:operator).permit(:email, :type, :password, :password_confirmation)
  end
end
