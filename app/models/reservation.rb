class Reservation < ApplicationRecord
    belongs_to :member
    belongs_to :schedule
    class << self#クラスメソッドを制作する際にクラス名.メソッド名と書かなくて済むself~endの間に記述すれば良い（複数置くことができるメリットがある。）
        def search(query)
            rel = Movie.order("title")#numbreカラムでソートをするという設定を持つリレーションオブジェクトをセット
            if query.present?
                #引数が空でなければSQLのLIKEを使って検索するリレーションオブジェクトの作成をする。https://qiita.com/chihiro/items/46da8571d4cf37d3123c
                rel = rel.where("title LIKE ?", "%#{query}%")
            else
            end
            rel#リレーションオブジェクトをメソッドの戻り値として返している
        end
    end
end
