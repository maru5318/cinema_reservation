titles = %w(アラジン 美女と野獣 ラプンチェル スティッチ トイストーリー アリエル 白雪姫 シンデレラ ターザン ライオンキング)
explanations = "ディズニーが提供する最強エンターテイメント、みんな見てね！"
distributions = %w(A B C D E)
fnames = ["金子","清水","坂田","コバヤシ","松橋","森"]
gnames = ["丸","圖仔","かずき","ルナ","柊也"]
0.upto(4) do |idx|
    Movie.create(
        title: titles[idx],
        explanation: explanations,
        released_at: Time.zone.parse("2021-#{rand(1..12)}-#{rand(1..28)}"),
        expired_at: Time.zone.parse("2022-#{rand(4..12)}-#{rand(1..28)}"),
        screening_time: "#{rand(45..140)}",
        distribution: "Disney movie #{distributions[idx % 4]}",
        director: "#{fnames[idx % 6]} #{gnames[idx % 5]}"
    )
end
5.upto(9) do |idx|
    Movie.create(
        title: titles[idx],
        explanation: explanations,
        released_at: Time.zone.parse("2022-#{rand(2..4)}-#{rand(1..28)}"),
        expired_at: Time.zone.parse("2022-#{rand(5..12)}-#{rand(1..28)}"),
        screening_time: "#{rand(45..140)}",
        distribution: "Disney movie #{distributions[idx % 4]}",
        director: "#{fnames[idx % 6]} #{gnames[idx % 5]}"
    )
end