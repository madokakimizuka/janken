class Player
    def hand
    # コンソールを入力待ち状態にし、プレイヤーがコンソールから打ち込んだ値を出力する処理のメソッドの処理をこの中に作成する
        puts("数字を入力してください。", "0: グー", "1: チョキ", "2: パー")
        player_hand = gets.chomp
        
        if player_hand == "0" || player_hand == "1" || player_hand == "2"
            return player_hand.to_i
        else
            puts "0〜2の数字を入力してください"
            return self.hand
        end
    end
end

class Enemy
  def hand
    # グー、チョキ、パーの値をランダムに出力するメソッドの処理をこの中に作成する 
    enemy_hand = rand(3)
  end
end

class Janken
  def pon(player_hand, enemy_hand)
    # プレイヤーが打ち込んだ値と、Enemyがランダムに出した値でじゃんけんをさせ、その結果をコンソール上に出力するメソッドをこの中に作成する
    # その際、あいこもしくはグー、チョキ、パー以外の値入力時には、もう一度ジャンケンをする
    # 相手がグー、チョキ、パーのうち、何を出したのかも表示させる
    result = (player_hand - enemy_hand + 3) % 3
    jankens = ["グー", "チョキ", "パー"]
    if result == 2
        puts "相手の手は#{jankens[enemy_hand]}です。あなたの勝ちです。"
    elsif result == 1
        puts "相手の手は#{jankens[enemy_hand]}です。あなたの負けです。"
    else
        puts "相手の手は#{jankens[enemy_hand]}です。あいこです。"
        player = Player.new
        enemy = Enemy.new
        self.pon(player.hand, enemy.hand)
    end
    
  end
end

player = Player.new
enemy = Enemy.new
janken = Janken.new

# 下記の記述で、ジャンケンメソッドが起動される
janken.pon(player.hand, enemy.hand)