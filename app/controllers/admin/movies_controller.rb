class Admin::MoviesController < Admin::Base
  # 会員一覧
  def index
    @movies = Movie.order("title")
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
    if @movie.save
      redirect_to :admin, notice: "作品を登録しました。"
    else
      render "new"
    end
  end

  # 会員情報の更新
  def update
    @movie = Movie.find(params[:id])
    @movie.assign_attributes(movie_params)
    if @movie.save
      redirect_to :admin_movies, notice: "作品情報を更新しました。"
    else
      render "edit"
    end
  end

  # 会員の削除
  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    redirect_to "admin/movies", notice: "会員を削除しました。"
  end

  # ストロング・パラメータ
  private def movie_params
    attrs = [
      :title,
      :remove_profile_picture,
      # :new_duty_ids,
      :explanation,
      :released_at,
      :expired_at,
      :screening_time,
      :distribution,
      :director,
    ]

    # attrs << :password if action_name == "create"

    params.require(:movie).permit(attrs)
  end
end
