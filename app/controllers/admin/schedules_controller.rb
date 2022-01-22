class Admin::SchedulesController < Admin::Base
  # 会員一覧
  def index
    @schedules = Schedule.order(id:"DESC")
      .page(params[:page]).per(15)
    #公開日と今日の日付が7日以内のみの設定をする
  end

  # 新規作成フォーム
  def new
    @schedule = Schedule.new()
    @movies = Movie.order("id")
  end

  # 上映の新規登録
  def create
    @movies = Movie.order("id")
    @schedule = Schedule.new(schedule_params)
    if Movie.find(@schedule.movie_id).released_at < @schedule.screening_date && @schedule.screening_date < Movie.find(@schedule.movie_id).expired_at
      @schedule.endtime = @schedule.starttime + @schedule.movie.screening_time*60
      p "上映時間=#{@schedule.movie.screening_time}"
      p "終了時間=#{@schedule.endtime}"
      p "劇場=#{@schedule.theater_id}"
      p "スクリーン=#{@schedule.screen_no}"
      p "スクリーン=#{@schedule.movie_id}"
      existing = Schedule.where(theater_id:@schedule.theater_id).where(screen_no:@schedule.screen_no).where(screening_date:@schedule.screening_date).where(starttime:@schedule.starttime)
      # p "あるかないか=#{Schedule.where(theater_id:@schedule.theater_id).first.id}"
      if existing.present?
        @error = "すでに上映が登録されている時間です"
        render "new"
      else
        if @schedule.save
          redirect_to :admin_schedules, notice: "上映を登録しました。"
        else
          render "new"
        end
      end
    else
      @error = "作品公開期間外です"
      render "new"
    end
  end
  def search
    @schedules = Scedule.search(params[:q])
    render"index"
  end
  # def edit
  #   @schedule = Schedule.find(params[:id])
  #   @movies = Movie.order("id")
  # end

  # 上映の更新
  # def update
  #   p "スタート時間#{params[:starttime]}"
  #   @movies = Movie.order("id")
  #   @schedule = Schedule.find(params[:id])
  #   @schedule.assign_attributes(schedule_params)
  #   @schedule.endtime = @schedule.starttime + @schedule.movie.screening_time*60
  #   existing = Schedule.where(theater_id:@schedule.theater_id).where(screen_no:@schedule.screen_no).where(screening_date:@schedule.screening_date).where(starttime:@schedule.starttime)
  #   if existing.present?
  #     #each回さないとダメ
  #     if existing[0].id == @schedule.id
  #       if @schedule.save
  #         redirect_to :admin_schedules, notice: "上映を更新しました。"
  #       else
  #         render "edit"
  #       end
  #     else
  #       @error = "すでに上映が登録されている時間です"
  #       render "edit"
  #     end
  #   else
  #     if @schedule.save
  #       redirect_to :admin_schedules, notice: "上映を更新しました。"
  #     else
  #       render "edit"
  #     end
  #   end
  # end
  # ストロング・パラメータ
  private def schedule_params
    attrs = [
      :screen_no,
      :theater_id,
      :movie_id,
      :screening_date,
      :starttime
    ]

    # attrs << :password if action_name == "create"

    params.require(:schedule).permit(attrs)
  end
end
