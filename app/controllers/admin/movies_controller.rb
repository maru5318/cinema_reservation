class Admin::MoviesController < Admin::Base
  # enum state: %i[arajin aratin]
  # 会員一覧
  def index
    @movies = Movie.order("title")
      .page(params[:page]).per(5)
  end

  # 検索
  def search
    @movies = Movie.search(params[:q])
    render "index"
  end

  # 会員情報の詳細
  def show
    @movie = Movie.find(params[:id])
  end

  # 新規作成フォーム
  def new
    @movie = Movie.new()
  end

  # 更新フォーム
  def edit
    @movies = Movie.order("title")
    @movie = Movie.find(params[:id])
  end

  # 会員の新規登録
  def create
    @movie = Movie.new(movie_params)
    if @movie.released_at > @movie.expired_at
      @error = "公開期間より終了期間が前になっています"
      render "new"
    else
      if @movie.released_at < Time.current && Time.current < @movie.expired_at
        if @movie.status == 0
          @error = "公開期間中の作品は非公開にできません"
          render "new"
        else
          if @movie.save
            redirect_to :admin_movies, notice: "作品を登録しました。"
          else
            render "new"
          end
        end
      else
        if @movie.save
          redirect_to :admin_movies, notice: "作品を登録しました。"
        else
          render "new"
        end
      end
    end
  end

  # 会員情報の更新
  def update
    @movie = Movie.find(params[:id])
    p "公開前#{@movie.released_at}と#{Time.current}"
    if @movie.released_at < Time.current && Time.current < @movie.expired_at
      if params[:movie][:status] == "0"
        redirect_to [:edit,:admin, @movie],alert: "公開期間中の作品は非公開にできません"
      else
        @movie.assign_attributes(movie_params)
        if @movie.save
          redirect_to :admin_movies, notice: "作品を更新しました。"
        else
          redirect_to [:edit,:admin, @movie]
        end
      end
    else
      @movie.assign_attributes(movie_params)
      if @movie.save
        redirect_to :admin_movies, notice: "作品を更新しました。"
      else
        render "edit"
      end
    end
  end

  # 会員の削除
  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    redirect_to "admin/movies", notice: "会員を削除しました。"
  end

  def changes
    @movies = Movie.order("title")
    @movies.each do |m|
      if m.expired_at < Time.current
        m.status = 0
        m.save
      end
    end
    redirect_to :admin_movies, notice: "作品を一括非公開しました。"
  end

  # ストロング・パラメータ
  private def movie_params
    attrs = [
      :title,
      :remove_profile_picture,
      # :new_duty_ids,
      :released_at,
      :explanation,
      :expired_at,
      :screening_time,
      :distribution,
      :director,
      :status
    ]

    attrs << :password if action_name == "create"

    params.require(:movie).permit(attrs)
  end
end
