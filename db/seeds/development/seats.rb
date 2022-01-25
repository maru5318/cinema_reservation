lines = %w(A B C D E F G H I J K L M N O)
ends = %w(30 30 30 30 30 30 30 30 30 30 40 40 40 40 40)
0.upto(10) do |a|
    0.upto(14) do |b|
        Seat.create(
            seat_group: a+1,
            line: lines[b],
            start_line: 1,
            last_line: ends[b].to_i,
            num: ends[b].to_i
        )
    end
end