class AccountsController < ApplicationController
  def show
    @member = current_member
  end
  def new
    @member = Member.new()
  end
  def create
    @member = Member.new(account_params)
    if @member.save
      cookies[:member_id] = {value: @member.id,expires: 10.hours.from_now}
      redirect_to :root, notice: "会員登録しました。"
    else
      render "new"
    end
  end
  def edit
    @member = current_member
  end
  # ストロング・パラメータ
  private def account_params
    attrs = [
      :login_id,
      :name,
      :birthday,
      :tel,
      :expired_at,
      :email,
      :payment,
      :password,
      :password_confirmation
    ]

    # attrs << :password if action_name == "create"

    params.require(:account).permit(attrs)
  end
end
