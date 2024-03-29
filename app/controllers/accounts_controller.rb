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
    p "#{current_member.name}-#{current_member.id}"
    @member = current_member
  end
  def update
    @member = current_member
    p "パラメータ#{account_params}"
    @member.assign_attributes(account_params)
    if @member.save
      redirect_to :root, notice: "個人情報を更新しました。"
    else
      render "edit"
    end
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
