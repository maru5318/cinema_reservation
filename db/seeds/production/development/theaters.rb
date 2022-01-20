store_names = %w(生田店 神田店 横浜店)
addresss = ["〒214-8580 神奈川県川崎市多摩区東三田２丁目１−１","〒101-8425 東京都千代田区神田神保町３丁目８","〒220-0012 神奈川県横浜市西区みなとみらい２丁目２−１"]
0.upto(2) do|idx|
    Theater.create(
        store_name: store_names[idx],
        address: addresss[idx],
        tel: "0#{rand(8..9)}0-#{rand(1000..9999)}-#{rand(1000..9999)}"
    )
end