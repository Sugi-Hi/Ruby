def janken
  
  play = ["グー", "チョキ", "パー"]  # ジャンケン出し配列化

  while true do
  puts "グー:0, チョキ:1, パー:2⇒数字(0~2)で入力して下さい！"
  you_player = gets.to_i
  pc_player = rand(3)

    # 条件(0~2)該当すれば無限ループを終了する！
    if you_player >= 0 && you_player <= 2
      break  # exit:def定義文と最初から終了する！
    end
    
  end

  puts "あなたの手:#{play[you_player]},相手コンピュータの手:#{play[pc_player]}"

  if you_player == pc_player
    puts "あいこでショ！" 
    return true
  elsif (you_player==0 && pc_player==1) || (you_player==1 && pc_player==2) || (you_player==2 && pc_player==0)
    puts "あなたの勝ちです！" 
    return false 
  else
    puts "あなたの負けです！" 
    return false 

  end

end

puts "最初はグー、ジャイケンポイ！"
next_play = true
while next_play do  # 次のプレイをtrue条件による継続コーディング!!
  next_play = janken
end



