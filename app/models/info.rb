class Info < ApplicationRecord
  belongs_to :user
  def self.where_to_add cur_user, cur_score, cur_time
    records = where(user_id: cur_user.id)
    if records.size < 10
      cur_user.infos.create(score: cur_score, time: to_tm(cur_time))
    else
      new_rec = records.min_by { |elem| elem.score }
      new_rec.update(score: cur_score, time: to_tm(cur_time)) unless new_rec.score > cur_score
    end
  end

  private
  def self.to_tm(duration)
    min, sec = duration.divmod(1000)
    total_in_seconds = min.minutes + sec.seconds
    Time.at(total_in_seconds).utc.strftime("%H:%M:%S")
  end
end
