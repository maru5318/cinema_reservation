titles = %w(アラジン 美女と野獣 ラプンチェル スティッチ トイストーリー アリエル 白雪姫 シンデレラ ターザン ライオンキング)
explanations = "ディズニーが提供する最強エンターテイメント、みんな見てね！"
distributions = %w(A B C D E)
fnames = ["金子","児玉","伊藤","コバヤシ","松橋","清水"]
gnames = ["丸","ちぃ","かずき","ルナ","健"]
0.upto(9) do |idx|
    Movie.create(
        title: titles[idx],
        explanation: explanations,
        released_at: Time.zone.parse("202#{rand(1..2)}-#{rand(1..3)}-#{rand(1..28)}"),
        expired_at: Time.zone.parse("2022-#{rand(4..12)}-#{rand(1..28)}"),
        screening_time: "#{rand(45..140)}",
        distribution: "Disney movie #{distributions[idx % 4]}",
        director: "#{fnames[idx % 4]} #{gnames[idx % 3]}"
    )
end