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
            flash[:alert] = "チケットを選択してください"
            render "show"
        else
            p"step1111 #{total_sheets}"
        end
        @reservation.chiket_sheets = total_sheets
        @reservation.total_sheets = total_price
        
        if @reservation.save
            p"更新できましたstep1"
        else
            p"更新できませんでした"
        end
        
    end
    def step2
        # p "step2#{params}"
        # p "step2#{params[:seats]}"
        @reservationdetails = Reservationdetail.where(reservation_id: params[:reservation][:id])
        unless params[:seats].nil? || params[:seats].keys.size < @reservationdetails.count
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
                    p"更新できましたstep2"
                else
                    p"更新できませんでした"
                end
            end
            @reservation = Reservation.find_by(id:params[:reservation][:id])
        else
            redirect_to :root, notice:"チケット数分座席を選択してください。お手数ですが最初からやり直してください"
        end 
    end
    def step3
        p "step3#{params[:reservation][:payment]}"
        @reservation = Reservation.find_by(id:params[:reservation][:id])
        @reservation.payment = params[:reservation][:payment]
        if @reservation.save
            p"更新できましたstep3"
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
        check = false
        p "update#{params[:format]}"
        @reservation = Reservation.find(params[:format])
        @reservationdetails = Reservationdetail.where(reservation_id:@reservation.id)
        @reservationdetails.each do |r|
            if Reservationdetail.where(seat:r.seat).present?
                others = Reservationdetail.where(seat:r.seat)
                others.each do |o|
                    p"座席被り1#{Reservation.find(o.reservation_id).status}"
                    p"座席被り2#{Reservation.find(o.reservation_id).status==1}"
                    p"座席被り3#{Reservation.find(o.reservation_id).status==1&& o.reservation.schedule.id == r.reservation.schedule.id}"
                    if Reservation.find(o.reservation_id).status == 1 && o.reservation.schedule.id == r.reservation.schedule.id
                        check = true
                    else
                        p"問題なし"
                    end
                end
            end
        end
        if check == true
            redirect_to :root,notice:"大変申し訳ございません。現在選択された座席は#{current_member.name}様がご予約中に他のお客様を予約を確定してしまいました。お手数おかけしますが最初からやり直してください"
        else
            @reservation.status = 1 
            if @reservation.save
                p"登録できました"
            else
                p"登録できませんでした"
            end
        end
    end
end