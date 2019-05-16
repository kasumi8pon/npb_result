module NpbResult
  class Game
    attr_reader :away_team, :away_score, :home_team, :home_score, :status, :start_time

    def initialize(away_team, away_score, home_team, home_score, status, start_time)
      @away_team = away_team
      @away_score = away_score
      @home_team = home_team
      @home_score = home_score
      @status = status
      @start_time = start_time
    end

    def display
      "【#{status}】#{away_team} (#{away_score}) - (#{home_score}) #{home_team}"
    end
  end
end
