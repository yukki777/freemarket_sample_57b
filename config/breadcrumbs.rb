crumb :root do
  link "メルカリ",root_path
end

# メルカリ＞マイページ
crumb :mypages do
  link 'マイページ',users_path
  parent :root
end

# メルカリ＞マイページ＞お知らせ
crumb :information do|information|
  link 'お知らせ'
  parent :mypages
end

# メルカリ＞マイページ＞やることリスト
crumb :todolist do|todolist|
  link 'やることリスト'
  parent :mypages
end

# メルカリ＞マイページ＞いいね！一覧
crumb :goodlist do|goodlist|
  link 'いいね！一覧'
  parent :mypages
end

# メルカリ＞マイページ＞出品した商品ー出品中
crumb :listed_items_listed do|listed_items_listed|
  link '出品した商品ー出品中'
  parent :mypages
end

# メルカリ＞マイページ＞出品した商品ー取引中
crumb :listed_items_trading do|listed_items_trading|
  link '出品した商品ー取引中'
  parent :mypages
end

# メルカリ＞マイページ＞出品した商品ー売却済み
crumb :listed_items_sold do|listed_items_sold|
  link '出品した商品ー売却済み'
  parent :mypages
end

# メルカリ＞マイページ＞購入した商品ー取引中
crumb :purchased_product_trading do|purchased_product_trading|
  link '購入した商品ー取引中'
  parent :mypages
end

# メルカリ＞マイページ＞購入した商品ー過去の取引
crumb :purchased_product_past_transactions do|purchased_product_past_transactions|
  link '購入した商品ー過去の取引'
  parent :mypages
end

# メルカリ＞マイページ＞ニュース一覧
crumb :neaslist do|newslist|
  link 'ニュース一覧'
  parent :mypages
end

# メルカリ＞マイページ＞評価一覧
crumb :evaluationlist do|evaluationlist|
  link '評価一覧'
  parent :mypages
end

# メルカリ＞マイページ＞お問い合わせ
crumb :contact_us do|contact_us|
  link 'お問い合わせ'
  parent :mypages
end

# メルカリ＞マイページ＞売上・振込申請
crumb :sales_transfer_application do|sales_transfer_application|
  link '売上・振込申請'
  parent :mypages
end

# メルカリ＞マイページ＞ポイント
crumb :point do|point|
  link 'ポイント'
  parent :mypages
end

# メルカリ＞マイページ＞プロフィール
crumb :profile do|profile|
  link 'プロフィール'
  parent :mypages
end

# メルカリ＞マイページ＞発送元・お届け先住所変更
crumb :change_of_shipping_delivery_address do|change_of_shipping_delivery_address|
  link '発送元・お届け先住所変更'
  parent :mypages
end

# メルカリ＞マイページ＞支払い方法
crumb :method_of_payment do|method_of_payment|
  link '支払い方法'
  parent :mypages
end

# メルカリ＞マイページ＞メール/パスワード
crumb :email_password do|email_password|
  link 'メール/パスワード'
  parent :mypages
end

# メルカリ＞マイページ＞本人情報
crumb :personal_information do|personal_information|
  link '本人情報の登録'
  parent :mypages
end

# メルカリ＞マイページ＞電話番号の確認
crumb :confirm_phone_number do|confirm_phone_number|
  link '電話番号の確認'
  parent :mypages
end

# メルカリ＞マイページ＞ログアウト
crumb :logout do|logout|
  link 'ログアウト'
  parent :mypages
end


# crumb :projects do
#   link "Projects", projects_path
# end

# crumb :project do |project|
#   link project.name, project_path(project)
#   parent :projects
# end

# crumb :project_issues do |project|
#   link "Issues", project_issues_path(project)
#   parent :project, project
# end

# crumb :issue do |issue|
#   link issue.title, issue_path(issue)
#   parent :project_issues, issue.project
# end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).