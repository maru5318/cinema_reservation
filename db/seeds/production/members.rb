fnames = ["佐藤","高橋","安西","北川","西尾"]
gnames = ["美優","裕香","圭介","雄太","太郎"]
0.upto(9)do|idx|
    Member.create(
        login_id:sprintf('%04d', rand(10000)),
        name:"#{fnames[idx % 4]} #{gnames[idx % 3]}",
        birthday: "200#{rand(0..9)}-#{rand(1..12)}-#{rand(1..28)}",
        tel: "0#{rand(8..9)}0-#{rand(1000..9999)}-#{rand(1000..9999)}",
        email: "email@example.com",
        payment:"#########################",
        password: "asagao!",
        password_confirmation: "asagao!"
    )
end