types = %w(大人 中高生 小学生 幼児)
totals = %w(2000 1500 1000 500)
0.upto(3) do |i|
    Ticket.create(
        t_type: types[i],
        total: totals[i]
    )
end