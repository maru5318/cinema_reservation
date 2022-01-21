class Admin::SchedulesController < Admin::Base
  before_action :admin_login_required
  # 会員一覧
  def index
    @schedules = Schedule.order("id")
    #公開日と今日の日付が7日以内のみの設定をする
  end

  # # 検索
  # def search
  #   @movies = Movie.search(params[:q])
  #   render "index"
  # end

  # # 会員情報の詳細
  # def show
  #   @movie = Movie.find(params[:id])
  # end

  # 新規作成フォーム
  def new
    @schedule = Schedule.new()
    @movies = Movie.order("id")
    p "確認#{@movies.first.title}"
  end

  # # 更新フォーム
  # def edit
  #   @movies = Movie.order("title")
  #   @movie = Movie.find(params[:id])
  # end

  # 上映の新規登録
  def create
    @schedule = Schedule.new(schedule_params)
    if @schedule.save!
      redirect_to :admin_schedules, notice: "上映を登録しました。"
    else
      render "new"
    end
  end
  # ストロング・パラメータ
  private def schedule_params
    attrs = [
      :screen_no,
      :theater_id,
      :movie_id,
      :screening_date,
      :starttime,
      :endtime
    ]

    # attrs << :password if action_name == "create"

    params.require(:schedule).permit(attrs)
  end
end
