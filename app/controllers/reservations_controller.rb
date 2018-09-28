class ReservationsController < ApplicationController
  def index
    @reservations = (Time.zone.now.to_date..((Time.zone.now + 4.months).to_date)).to_a.map { |date| { date: date, day: l(date, format: "%A", locale: :pl) } }
  end
end
