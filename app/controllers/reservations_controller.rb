class ReservationsController < ApplicationController
    def step1
        # @reservaiton = Reservation.where(schedule_id:params[:schedule_id]).find_by(member_id:current_member.id)
    end
    def step2

    end
    def show
        @reservation = Reservation.new(
            schedule_id:params[:schedule_id],
            member_id: current_member.id,
            confirm_time: Time.current,
            status: 0
        )
        # @reservaiton.save
        # p "いいい#{@reservaiton.status}"
    end
end