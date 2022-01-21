class SessionsController < ApplicationController
    def create
        member = Member.find_by(login_id: params[:login_id])#login_id:カラムからパラメータと一致した最初のレコードを返す。
        if member&.authenticate(params[:password])
            #&.ぼっち演算子（左辺のオブジェクトがnilだとnilを返し、そうでない場合は右辺のオブジェクトを返す
            cookies[:member_id] = {value: member.id,expires: 100.minutes.from_now}
            cookies.delete(:admin_id)
            #セッションデータに値を格納（member.id) 参照url: https://railsdoc.com/page/cookies_signed
            #.sined=暗号化 ないと平文で登録 createには必要
            #有効期限 参照url: https://qiita.com/ren0826jam/items/a0d2eb76b4c571a02c2b
        else
            flash.alert = "名前とパスワードが一致しません"
            #リダイレクトの際アクションとアクションの間にデータを引き継ぐことができる。
        end
        redirect_to :root
    end
    def destroy
        cookies.delete(:member_id)
        #セッションデータからの削除 参照url: https://railsdoc.com/page/cookies_delete
        redirect_to :root
    end
end
