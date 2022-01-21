starttimes = %w(9:00 12:00 15:00 18:00 21:00)
endtimes = %w(11:00 14:00 17:00 20:00 23:00)
1.upto(10) do |a|
    0.upto(4) do |c|
        Schedule.create(
        screen_no: a,
        theater_id: 1,
        movie_id: rand(1..10),
        screening_date: Time.current,
        starttime: Time.parse("#{Date.today}-#{starttimes[c]}"),
        endtime: Time.parse("#{Date.today}-#{endtimes[c]}")
        )
    end
end
