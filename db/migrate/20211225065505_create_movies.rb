class CreateMovies < ActiveRecord::Migration[5.2]
  def change
    create_table :movies do |t|
      t.string :title,null: false
      t.text :explanation,null: false#説明
      t.date :released_at,null: false#公開開始日
      t.date :expired_at,null: false#公開終了日
      t.integer :screening_time,null: false#上映時間
      t.string :distribution,null: false#配給
      t.string :director,null: false#監督
      t.timestamps
    end
  end
end
