class Post < ApplicationRecord
  validates :title, presence: true
  validates :start_day, presence: true, unless: -> { start_day.blank? }
  validates :end_day, presence: true, unless: -> { end_day.blank? }
  validates :title, length: { maximum: 20 }
  validates :schedule, length: { maximum: 500 }
  validate :startday_check
  validate :endday_check
  validate :start_end_check

 
  def startday_check
    if start_day.nil?
    errors.add(:start_day, "を選択してください。")
    end
  end

  def endday_check
    if end_day.nil?
    errors.add(:end_day, "を選択してください。")
    end
  end

  def start_end_check
    unless start_day == nil or end_day == nil
      if start_day > end_day
         errors.add(:end_day, "は開始日より前にできません。")
      end
    end
   end
  end
