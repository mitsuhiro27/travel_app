class Reservation < ApplicationRecord
    belongs_to :user
    belongs_to :room

    attribute :number,  :integer, default: 0

    validates :start_day, presence: true
    validates :end_day, presence: true
    validates :number, presence: true
    
    validate :date_before_start
validate :date_before_finish

validate :start_date_check
  validate :start_end_check
  
  def start_date_check 
    errors.add(:start_day,"に過去の日付は指定できません") if start_day.nil? || start_day < Date.today
  end
  def start_end_check
    errors.add(:end_day,"は開始日より後の日付を指定してください") if end_day.nil? || start_day > end_day
  end  
end