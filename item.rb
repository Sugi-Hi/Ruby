def register_item(items)  # 販売商品の登録
  item = {}

  puts "販売中の商品名を入力して下さい！"
  item[:name] = gets.chomp
  puts "販売商品の値段(円)を入力して下さい！"
  item[:price] = gets.to_i
  puts "販売商品の個数(1個入単位)を入力して下さい！"
  item[:number] = gets.to_i
  puts "販売商品の種類(食品、飲料、お菓子、衣類、生活品、文具、洗面具、植物など)を入力して下さい！"
  item[:kind] = gets.chomp
  puts "販売商品の包装物(袋、箱、パック、紙、ペットボトル、缶、ビン、容器、シールなど)"
  item[:form] = gets.chomp

  items << item
end

def index_item(items)  # 販売商品の一覧

  index = 0

  puts "店舗内の販売商品の一覧リスト"  
  items.each do |item|
    index += 1
    puts "商品番号[#{index}]#{item[:name]}:#{item[:price]}円、#{item[:number]}個"
  end
  puts "詳細を見たい商品番号を数字入力して下さい！"
  input = gets.to_i

  if input>0 && input<=items.length
    show_item(items[input-1])
  else
    puts "商品番号が無い為、再度入力し直して下さい。"
  end

end

def show_item(item)
  puts "商品名：#{item[:name]}"
  puts "販売商品の値段　:#{item[:price]}"
  puts "販売商品の個数　:#{item[:number]}"
  puts "販売商品の種類　:#{item[:kind]}"
  puts "販売商品の包装物:#{item[:form]}"
  puts "この商品を購入しますか？(y/n)"
  buy = gets.chomp
  if buy == "y" || buy == "Y"
    buy_item(item)
  else
    puts "購入せず商品棚戻します。"
  end
end
def buy_item(item)  # 販売商品の購入を詳細から決定！
  money -= item[:price] 
end 

items = []  # 必要な商品データ情報

# 所持金
puts "初めの所持金(円)を入力して下さい！"
money = gets.to_i

while true do
  puts "店舗の販売商品において、やりたい事を下記のコード番号[0][1][2]で選択して下さい。"
  puts "[0]販売されている商品データ登録"
  puts "[1]全販売商品データ一覧のチェック"
  puts "[2]店舗から出て終了"
  input = gets.to_i

  puts "残金:#{money}"

  if input == 0
    register_item(items)
  elsif input == 1
    index_item(items)
  elsif input == 2
    exit
  else
    puts "存在するコード番号を再度入力して下さい！"
  end

end