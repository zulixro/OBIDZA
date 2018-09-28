class ReservationsController < ApplicationController
  before_action :load_reservations, only: :index

  def index
    @reservations = @dates.map do |date_set|
      { 
        date: date_set.keys.first,
        day: l(date_set.keys.first, format: "%A", locale: :pl),
        state: get_state(date_set.values.first),
        name: date_set.values.first.try(:name)
      }
    end
  end

  private

  def load_reservations
    @dates = (Time.zone.now.to_date..((Time.zone.now + 4.months).to_date)).to_a.map do |date|
      { date => get_reservation(date) }
    end
  end

  def get_state(reservation)
    reservation.nil? ? 'free' : 'reserved'
  end

  def get_reservation(date)
    Reservation.where("date_from <= ?", date).where("date_to >= ?", date).first
  end
end
