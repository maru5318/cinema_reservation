class Member < ApplicationRecord
    has_many :reservations
    has_secure_password 
    class << self#クラスメソッドを制作する際にクラス名.メソッド名と書かなくて済むself~endの間に記述すれば良い（複数置くことができるメリットがある。）
        def search(query)
            rel = order("name")#numbreカラムでソートをするという設定を持つリレーションオブジェクトをセット
            if query.present?
                #引数が空でなければSQLのLIKEを使って検索するリレーションオブジェクトの作成をする。https://qiita.com/chihiro/items/46da8571d4cf37d3123c
                rel = rel.where("name LIKE ?", "%#{query}%")
            else
            end
            rel#リレーションオブジェクトをメソッドの戻り値として返している
        end
    end
    validates :name, presence: true,
        format: {#format=型、形式,withオプションで与えられた正規表現と:nameがマッチしているかを検証する。
            with: /\A[A-Za-zぁ-んァ-ヶｱ-ﾝﾞﾟ一-龠]*\z/,#正規表現
            allow_blank: true,
            message: :invalid_member_name#バリデーション失敗時にerrorコレクションに追加されるカスタムエラーメッセージ
        },
        # length: { minimum: 2, maximum: 20, allow_blank: true },#length=属性(:name)の値の長さ
        uniqueness: { case_sensitive: false }
    validates :email,
        email:{
            allow_blank: true
        },
        format: { 
            with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
        }
    validates :birthday,
    date:{before: Proc.new{Date.today}}
    validates :tel, presence: true,
    format: { with: /\A[\d\(\)\-]+\z/,allow_blank: true},
    length: { minimum:8,maximum:20,allow_blank: true},
    uniqueness: {case_sensitive: false,allow_blank: true}
    validates :login_id, presence: true,
    format: { with: /\A[A-Za-z0-9]*\z/,allow_blank: true},
    length: { minimum:4,maximum:8,allow_blank: true},
    uniqueness: {case_sensitive: false,allow_blank: true}
end
