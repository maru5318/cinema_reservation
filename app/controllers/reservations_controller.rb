class ReservationsController < ApplicationController
    before_action :login_required
    def step1
        # p"#{params}"
        # p"#{params[:reservation][:id]}"
        @reservation = Reservation.find_by(id:params[:reservation][:id])
        @quantity = {'1': params[:adult],'2': params[:student],'3': params[:children],'4': params[:infant]}
        total_sheets = 0
        total_price = 0
        @quantity.each do |i,quantity|
            total_sheets = total_sheets + quantity.to_i
            1.upto(quantity.to_i) do
                total_price = total_price + Ticket.find(i.to_s).total*1
                @reservationdetail = Reservationdetail.new(
                    reservation_id: @reservation.id,
                    ticket_id: i.to_s
                )
                # p"step1#{i}"
                if @reservationdetail.save
                    p"登録できました"
                else
                    p"登録できませんでした"
                end
            end
        end
        p"step1#{total_sheets}"
        if total_sheets == 0
            redirect_to [Theater.find(Schedule.find(@reservation.schedule_id).theater_id),Movie.find(Schedule.find(@reservation.schedule_id).movie_id)], notice: "枚数を選択してください"
        else
            p"step1111 #{total_sheets}"
        end
        @reservation.chiket_sheets = total_sheets
        @reservation.total_sheets = total_price
        
        if @reservation.save
            p"更新できました"
        else
            p"更新できませんでした"
        end
        
    end
    def step2
        # p "step2#{params}"
        # p "step2#{params[:seats]}"
        @reservationdetails = Reservationdetail.where(reservation_id: params[:reservation][:id])
        seats = []
        i = 0
        params[:seats].each do |s,t|
            seats[i] = s
            i = i + 1
        end
        # p "step2#{seats}"
        i = 0
        @reservationdetails.each do |r|
            r.seat = seats[i]
            i = i + 1
            if r.save
                p"更新できました"
            else
                p"更新できませんでした"
            end
        end
        @reservation = Reservation.find_by(id:params[:reservation][:id])
    end
    def step3
        p "step3#{params[:reservation][:payment]}"
        @reservation = Reservation.find_by(id:params[:reservation][:id])
        @reservation.payment = params[:reservation][:payment]
        if @reservation.save
            p"更新できました"
        else
            p"更新できませんでした"
        end
        @member = Member.find(@reservation.member_id)
        @schedule = Schedule.find(@reservation.schedule_id)
    end
    def show
        @reservation = Reservation.new(
            schedule_id:params[:schedule_id],
            member_id: current_member.id,
            confirm_time: Time.current,
            status: 0
        )
        if @reservation.save
            p"仮登録できました"
        else
            p"仮登録できませんでした"
        end
        # p "show#{Seat.where(seat_group: @reservation.schedule.screen_no)}"
    end
    def update
        p "update#{params[:format]}"
        @reservation = Reservation.find(params[:format])
        @reservation.status = 1
        if @reservation.save
            p"登録できました"
        else
            p"登録できませんでした"
        end
    end
end