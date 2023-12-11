struct Time
  def self.now
    t = Time.utc;
    "#{t.year}#{t.month}#{t.day}#{t.hour}#{t.minute}#{t.second}#{t.millisecond}#{t.nanosecond}";
  end
end
