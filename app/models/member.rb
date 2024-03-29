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
            with: /\A[ぁ-んァ-ン一-龥a-zA-Z\s]+\z/,#正規表現
            allow_blank: true,
            message: "は日本語かアルファベットを空白を開けずに使用してください"#バリデーション失敗時にerrorコレクションに追加されるカスタムエラーメッセージ
        },
        length: { minimum: 2, maximum: 20, allow_blank: true ,message: 'は2文字以上20字以内で入力してください。'}#length=属性(:name)の値の長さ
    validates :email,presence:true,
        format: { 
            with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i,
            allow_blank: true,
            message:"は、アルファベットとハイフンを使って---@----.---の形で入力してください"
        }
    validates :birthday,
    date:{before: Proc.new{Date.today}}
    validates :tel, presence: true,
    format: { with: /\A[\d\(\)\-]+\z/,allow_blank: true,message: 'は数字とハイフンで入力してください。'},
    length: { minimum:8,maximum:20,allow_blank: true,message: 'は8文字以上20文字以内で入力してください。'}
    validates :login_id, presence: true,
    format: { with: /\A[A-Za-z0-9]*\z/,allow_blank: true,message: 'はアルファベットと数字で入力してください。'},
    length: { minimum:4,maximum:8,allow_blank: true,message: 'は4文字以上8文字以内で入力してください。'},
    uniqueness: {case_sensitive: false,allow_blank: true}
    validates :payment, presence: true,
    format: { with: /\A[0-9]+\z/,allow_blank: true,message: 'は数字のみで入力してください。'},
    length: { minimum:12,maximum:12,allow_blank: true,message: 'は12桁で入力してください。'},
    uniqueness: {case_sensitive: false,allow_blank: true}
end
