class Admin::AccountsController < Admin::Base
  def new
    @admin = Admin.new()
  end
  def create
    @admin = Admin.new(admin_account_params)
    if @admin.save!
      cookies[:admin_id] = {value: @admin.id,expires: 10.hours.from_now}
      p "ここ!#{cookies[:admin_id]}"
      redirect_to :admin, notice: "会員登録しました。"
    else
      render "new"
    end
  end
  # ストロング・パラメータ
  private def admin_account_params
    attrs = [
      :login_id,
      :name,
      :birthday,
      :tel,
      :email,
      :password,
      :password_confirmation
    ]
    # attrs << :password if action_name == "create"

    params.require(:admin).permit(attrs)
  end
end
