class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :release_year, presence: true, if: :released?
  validate :future_date?
  validates :title, uniqueness: true

  def future_date?
    if release_year.present? && release_year > Date.today.year.to_i && released == true
      errors.add(:release_year, "can't be in the future")
    end
  end


end
