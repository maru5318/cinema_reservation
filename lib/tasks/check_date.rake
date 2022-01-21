namespace :check_date do
    desc "check_state"# このタスクの説明を書く
# タスクの名前。「:environment」がないとDBやモデルにアクセスできないので、使う場合は付ける
  task check_state: :environment do
    Movie.where('title <= ?', Time.zone.now).arajin.each(&:aratin)
# articlesテーブルで[公開日が現在時刻以前かつステータス「公開待ち」]のものを全て「公開」に変更
  end
end
