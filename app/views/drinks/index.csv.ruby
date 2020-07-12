require 'csv'

CSV.generate do |csv|
  # 1行目にラベルを追加
  csv_column_labels = %w(名前 説明 作った人 作り方参照用URL\
                         コツ・ポイント 所要時間[分] 分量[人分] 最初に作った日時\
                         必要なモノ1の名前 必要なモノ1の備考 必要なモノ2の名前 必要なモノ2の備考\
                         必要なモノ3の名前 必要なモノ3の備考 必要なモノ4の名前 必要なモノ4の備考\
                         必要なモノ5の名前 必要なモノ5の備考 必要なモノ6の名前 必要なモノ6の備考\
                         必要なモノ7の名前 必要なモノ7の備考 必要なモノ8の名前 必要なモノ8の備考\
                         必要なモノ9の名前 必要なモノ9の備考 必要なモノ10の名前 必要なモノ10の備考)
  csv << csv_column_labels
  # 各レシピのカラム値を追加
  current_user.feed.each do |drink|
    # まず必要なモノ以外のカラムを追加
    csv_column_values = [
      drink.name,
      drink.description,
      drink.user.name,
      drink.reference,
      drink.tips,
      drink.required_time,
      drink.portion,
      drink.created_at.strftime("%Y/%m/%d(%a)")
    ]
    # 必要なモノの数(number_of_items)を特定
    # 初期値を9にしておき、nameが空のモノが見つかったらその配列番号に置き換える
    number_of_items = 9
    drink.items.each_with_index do |ing, index|
      if ing.name.empty?
        number_of_items = index
        break
      end
    end
    # 必要なモノの数だけカラムを追加する
    i = 0
    while i <= number_of_items
      csv_column_values.push(drink.items[i].name, drink.items[i].remarks)
      i += 1
    end
    # 最終的なcsv_column_valuesをcsvのセルに追加
    csv << csv_column_values
  end
end
