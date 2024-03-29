starttimes = %w(9:00 12:00 15:00 18:00 21:00)
1.upto(3) do |i|
    0.upto(6) do |d|
        1.upto(5) do |a|
            0.upto(4) do |c|
                Schedule.create(
                screen_no: 11-a,
                theater_id: i,
                movie_id: a,
                screening_date: Time.current.since(d.days),
                starttime: Time.zone.parse("#{starttimes[c]}"),
                endtime: Time.zone.parse("#{starttimes[c]}")+Movie.find(11-a).screening_time*60
                )
            end
        end
    end
end
1.upto(3) do |i|
    0.upto(6) do |d|
        6.upto(10) do |a|
            0.upto(4) do |c|
                Schedule.create(
                screen_no: 11-a,
                theater_id: i,
                movie_id: a,
                screening_date: Time.current.since(d+120.days),
                starttime: Time.zone.parse("#{starttimes[c]}"),
                endtime: Time.zone.parse("#{starttimes[c]}")+Movie.find(11-a).screening_time*60
                )
            end
        end
    end
end
