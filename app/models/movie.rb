class Movie < ApplicationRecord
    has_many :schedules
    class << self#クラスメソッドを制作する際にクラス名.メソッド名と書かなくて済むself~endの間に記述すれば良い（複数置くことができるメリットがある。）
        def search(query)
            rel = order("title")#numbreカラムでソートをするという設定を持つリレーションオブジェクトをセット
            if query.present?
                #引数が空でなければSQLのLIKEを使って検索するリレーションオブジェクトの作成をする。https://qiita.com/chihiro/items/46da8571d4cf37d3123c
                rel = rel.where("title LIKE ?", "%#{query}%")
            else
            end
            rel#リレーションオブジェクトをメソッドの戻り値として返している
        end
        def search_date(query)
            rel = Schedule.order("screening_date")#numbreカラムでソートをするという設定を持つリレーションオブジェクトをセット
            if query.present?
                #引数が空でなければSQLのLIKEを使って検索するリレーションオブジェクトの作成をする。https://qiita.com/chihiro/items/46da8571d4cf37d3123c
                rel = rel.where("screening_date LIKE ?", "%#{query}%")
            else
                p "ないですよ"
            end
            rel#リレーションオブジェクトをメソッドの戻り値として返している
        end
    end
    validates :title, presence: true,uniqueness: true
    validates :explanation, presence: true
    # validates :released_at, presence: true,date:{after: Proc.new{Date.today}}
    # validates :expired_at, presence: true,date:{after: Proc.new{Date.today}}
    validates :screening_time, presence: true,numericality: { greater_than: 0,message: :invalid}
end
