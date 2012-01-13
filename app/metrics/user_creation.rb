class UserCreation < Metric
  class User < ActiveMetric::Base
    # connects to users table in the database from daily.yml
  end
  
  def column_names
    ["Date", "Signups"]
  end
  
  def add_rows(table)
    current = Date.today
    start_date = current - 30.days
    while current >= start_date
      count = User.where("created_at >= ?", current.beginning_of_day).where("created_at <= ?", current.end_of_day).count
      table << [current, count]
      current -= 1.day
    end
  end
end