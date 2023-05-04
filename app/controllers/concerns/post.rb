class Post < ApplicationRecord
  validates :title, presence: true
  validates :start_day, presence: true
  validates :end_day, presence: true
  validates :title, length: { maximum: 20 }
  validates :schedule, length: { maximum: 500 }
  validate :days, on: :create ,on: :update

  def days
    if start_day != nil
      unless start_day.blank?
        
      end
    if start_day > end_day
      errors.add(:end_day,"は開始日より前の日付で登録できません。")
    end
    

    end
  end
end
