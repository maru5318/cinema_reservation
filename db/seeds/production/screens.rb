1.upto(3)do |d|
    1.upto(10) do |n|
    Screen.create(
        screen_no: n,
        theater_id: d,
        seat_group: n%5+1
    )
    end
end