class Admin::ReservationsController < Admin::Base
  # 予約一覧
  def index
    @reservations = Reservation.order("member_id")
      # .page(params[:page]).per(5)
  end
  # def search
  #   @reservations = Reservation.search(params[:p])
  #   render "index"
  # end
  # 予約詳細
  def show
    @reservation = Reservation.find(params[:id])
    @reservationdetails = Reservationdetail.where(reservation_id:params[:id])
  end
end
