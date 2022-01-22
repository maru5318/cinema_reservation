class Admin::ReservationsController < Admin::Base
  # 予約一覧
  def index
    @reservations = Reservation.order("member_id")
      .page(params[:page]).per(5)
  end
  def search
    title_id = Reservation.search(params[:q])
    t_id = []
    title_id.each_with_index do |title,i|
      t_id[i] = title.id
    end
    reservations = []
    r = 0
    0.upto(t_id.count-1) do |i|
      s_id = Schedule.where(movie_id: t_id[i])
      s_id.each do |s|
        reservations[r] = Reservation.where(schedule_id:s.id)
        r = r + 1
      end
    end
    new_reservations = []
    i = 0
    reservations.each do |item|
      p "#{i}"
      item.each do |price|
        new_reservations[i] = price
        i = i + 1
      end
    end
    @reservations = new_reservations
    render "index"
  end
  # 予約詳細
  def show
    @reservation = Reservation.find(params[:id])
    @reservationdetails = Reservationdetail.where(reservation_id:params[:id])
  end
  def destroys
    @reservations = Reservation.order("status")
    @reservations.each do |re|
      if re.status == 0
        re.destroy
      end
    end
    redirect_to "/admin/reservations"
  end
  def sort
    @reservations = Reservation.order("#{params[:sort]}")
      .page(params[:page]).per(5)
    render "index"
  end
end
