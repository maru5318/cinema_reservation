lines = %w(A B C D E F G H I J K L M N O)

0.upto(10) do |a|
    0.upto(14) do |b|
        Seat.create(
            seat_group: a+1,
            line: lines[b],
            start_line: 1,
            last_line: 10,
            num: 10 
        )
    end
end