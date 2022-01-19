class Admin::AccountsController < Admin::Base
  def new
    @admin = Admin.new()
  end
  def create
    @admin = Admin.new(
      login_id:params[:login_id],
      name:params[:name],
      birthday:params[:birthday],
      tel:params[:tel],
      email:params[:email],
    )
    if @admin.save!
      cookies[:admin_id] = {value: @admin.id,expires: 10.hours.from_now}
      p "ここ!#{cookies[:admin_id]}"
      redirect_to :admin, notice: "会員登録しました。"
    else
      render "new"
    end
  end
end
