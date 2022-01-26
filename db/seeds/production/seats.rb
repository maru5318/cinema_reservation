a_lines = %w(A B C D E F G H I J K L M N O)
a_end = %w(30 30 30 30 30 30 30 30 30 30 40 40 40 40 40)
0.upto(14) do |b|
    Seat.create(
        seat_group: 1,
        line: a_lines[b],
        start_line: 1,
        last_line: a_end[b].to_i,
        num: a_end[b].to_i
    )
end
b_lines = %w(A B C D E F G H I J K L M N O)
b_start = %w(8 8 8 8 8 8 8 8 7 6 5 4 3 2 1)
b_end = %w(33 33 33 33 33 33 33 33 34 35 36 37 38 39 40)
0.upto(14) do |b|
    Seat.create(
        seat_group: 2,
        line: b_lines[b],
        start_line: b_start[b].to_i,
        last_line: b_end[b].to_i,
        num: b_end[b].to_i-b_start[b].to_i+1
    )
end
c_lines = %w(A B C D E F G H I J K L)
c_start = %w(1 1 1 1 1 5 5 1 1 1 1 3)
c_end = %w(25 25 25 25 25 20 20 25 25 25 25 25)
0.upto(11) do |b|
    Seat.create(
        seat_group: 3,
        line: c_lines[b],
        start_line: c_start[b].to_i,
        last_line: c_end[b].to_i,
        num: c_end[b].to_i-c_start[b].to_i+1
    )
end
d_lines = %w(A B C D E F G H I J K L M N)
d_start = %w(1 1 1 1 1 0 1 1 1 0 1 1 1 1)
d_end = %w(30 30 30 30 30 0 30 30 30 0 30 30 30 30)
0.upto(13) do |b|
    Seat.create(
        seat_group: 4,
        line: d_lines[b],
        start_line: d_start[b].to_i,
        last_line: d_end[b].to_i,
        num: d_end[b].to_i
    )
end
e_lines = %w(A B C D E F G H I J K L M N)
e_start = %w(1 2 3 4 5 6 7 7 7 7 7 7 7 7)
e_end = %w(35 35 35 35 35 35 35 35 35 35 35 35 35 35)
0.upto(13) do |b|
    Seat.create(
        seat_group: 5,
        line: e_lines[b],
        start_line: e_start[b].to_i,
        last_line: e_end[b].to_i,
        num: e_end[b].to_i
    )
end
f_lines = %w(A B C D E F G H I J K L M N O P Q R S T)
0.upto(19) do |b|
    Seat.create(
        seat_group: 6,
        line: f_lines[b],
        start_line: 1,
        last_line: 35,
        num: 35
    )
end
g_lines = %w(A B C D E F G H I J K L M N O P)
g_start = %w(1 1 1 1 1 1 1 0 1 1 1 1 1 1 1 1)
g_end = %w(30 30 30 30 30 30 30 0 30 30 30 30 30 30 30 29)
0.upto(15) do |b|
    Seat.create(
        seat_group: 7,
        line: g_lines[b],
        start_line: g_start[b].to_i,
        last_line: g_end[b].to_i,
        num: g_end[b].to_i
    )
end
h_lines = %w(A B C D E F G H I J K L M N O P Q R)
h_start = %w(1 1 1 1 1 1 1 13 13 13 13 13 1 1 1 1 1 1)
h_end = %w(30 30 30 30 30 30 30 17 17 17 17 17 30 30 30 30 30 30)
0.upto(17) do |b|
    Seat.create(
        seat_group: 8,
        line: h_lines[b],
        start_line: h_start[b].to_i,
        last_line: h_end[b].to_i,
        num: h_end[b].to_i
    )
end
i_lines = %w(A B C D E F G H I J)
0.upto(9) do |b|
    Seat.create(
        seat_group: 9,
        line: i_lines[b],
        start_line: 1,
        last_line: 50,
        num: 50
    )
end
j_lines = %w(A B C D E F G H I J K L M N O P Q R S T U V)
j_start = %w(6 6 6 6 6 6 6 6 6 6 5 5 5 4 4 4 3 3 2 2 1 1)
j_end = %w(25 25 25 25 25 25 25 25 25 25 26 26 26 27 27 28 28 30 30 30 30 30)
0.upto(21) do |b|
    Seat.create(
        seat_group: 10,
        line: j_lines[b],
        start_line: j_start[b].to_i,
        last_line: j_end[b].to_i,
        num: j_end[b].to_i
    )
end