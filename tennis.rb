class TennisGame1
  def initialize(name1, name2)
    @name1 = name1
    @name2 = name2
    @score1 = 0
    @score2 = 0
  end

  def won_point(player_name)
    if player_name == @name1
      @score1 += 1
    else
      @score2 += 1
    end
  end

  def score
    result = ""
    tempScore = 0

    if (@score1 == @score2)
      result = {
        0 => "Love-All",
        1 => "Fifteen-All",
        2 => "Thirty-All",
      }.fetch(@score1, "Deuce")

    elsif (@score1 >= 4 or @score2 >= 4)
      minusResult = @score1-@score2
      if (minusResult == 1)
        result ="Advantage " + @name1
      elsif (minusResult == -1)
        result ="Advantage " + @name2
      elsif (minusResult >= 2)
        result = "Win for " + @name1
      else
        result ="Win for " + @name2
      end

    else
      (1...3).each do |i|
        if (i==1)
          tempScore = @score1
        else
          result+="-"
          tempScore = @score2
        end
        result += {
          0 => "Love",
          1 => "Fifteen",
          2 => "Thirty",
          3 => "Forty",
        }[tempScore]
      end
    end
    result
  end
end

class TennisGame2
  def initialize(name1, name2)
    @name1 = name1
    @name2 = name2
    @score1 = 0
    @score2 = 0
  end

  def won_point(player_name)
    if player_name == @name1
      player1_score
    else
      player2_score
    end
  end

  def score
    result = ""

    if (@score1 == @score2 and @score1 < 3)
      if (@score1 == 0)
        result = "Love"
      end

      if (@score1 == 1)
        result = "Fifteen"
      end

      if (@score1 == 2)
        result = "Thirty"
      end
      result += "-All"
    end

    if (@score1 == @score2 and @score1 > 2)
      result = "Deuce"
    end

    player1_result = ""
    player2_result = ""

    if (@score1 > 0 and @score2 == 0)
      if (@score1 == 1)
        player1_result = "Fifteen"
      end

      if (@score1 == 2)
        player1_result = "Thirty"
      end

      if (@score1 == 3)
        player1_result = "Forty"
      end

      player2_result = "Love"
      result = player1_result + "-" + player2_result
    end

    if (@score2 > 0 and @score1==0)
      if (@score2 == 1)
        player2_result = "Fifteen"
      end

      if (@score2 == 2)
        player2_result = "Thirty"
      end

      if (@score2 == 3)
        player2_result = "Forty"
      end

      player1_result = "Love"
      result = player1_result + "-" + player2_result
    end

    if (@score1 > @score2 and @score1 < 4)
      if (@score1 == 2)
        player1_result="Thirty"
      end

      if (@score1 == 3)
        player1_result="Forty"
      end

      if (@score2 == 1)
        player2_result="Fifteen"
      end

      if (@score2 == 2)
        player2_result="Thirty"
      end

      result = player1_result + "-" + player2_result
    end

    if (@score2 > @score1 and @score2 < 4)
      if (@score2 == 2)
        player2_result="Thirty"
      end

      if (@score2 == 3)
        player2_result="Forty"
      end

      if (@score1 == 1)
        player1_result="Fifteen"
      end

      if (@score1 == 2)
        player1_result="Thirty"
      end

      result = player1_result + "-" + player2_result
    end

    if (@score1 > @score2 and @score2 >= 3)
      result = "Advantage " + @name1
    end

    if (@score2 > @score1 and @score1 >= 3)
      result = "Advantage " + @name2
    end

    if (@score1 >= 4 and @score2 >= 0 and (@score1-@score2) >= 2)
      result = "Win for " + @name1
    end

    if (@score2 >= 4 and @score1 >= 0 and (@score2-@score1 )>= 2)
      result = "Win for " + @name2
    end

    result
  end

  def setplayer1_score(number)
    (0..number).each do |i|
      player1_score
    end
  end

  def setplayer2_score(number)
    (0..number).each do |i|
      player2_score
    end
  end

  def player1_score
    @score1 += 1
  end

  def player2_score
    @score2 += 1
  end
end

class TennisGame3
  def initialize(name1, name2)
    @name1 = name1
    @name2 = name2
    @score1 = 0
    @score2 = 0
  end

  def won_point(name)
    if name == @name1
      @score1 += 1
    else
      @score2 += 1
    end
  end

  def score
    if (@score1 < 4 and @score2 < 4) and (@score1 + @score2 < 6)
      p = ["Love", "Fifteen", "Thirty", "Forty"]
      s = p[@score1]
      if @score1 == @score2
        s + "-All"
      else
        s + "-" + p[@score2]
      end
    else
      if (@score1 == @score2)
        "Deuce"
      else
        s = if @score1 > @score2
          @name1
        else
          @name2
        end

        if (@score1-@score2)*(@score1-@score2) == 1
          "Advantage " + s
        else
          "Win for " + s
        end
      end
    end
  end
end
