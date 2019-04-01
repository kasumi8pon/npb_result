require "npb_result/version"
require "date"
require "open-uri"
require "nokogiri"

module NpbResult
  def self.display(date: Date.today, team: nil)
    results = list(date: date, team: team)
    if results.empty?
      "試合なし"
    else
      results.inject("") do |display, result|
        display << "【#{result[:status]}】#{result[:away_team]} (#{result[:away_score]})" +
                   " - (#{result[:home_score]}) #{result[:home_team]}\n"
      end
    end
  end

  def self.list(date: Date.today, team: nil)
    d = date
    input_url = "https://baseball.yahoo.co.jp/npb/schedule/?date=#{d.strftime("%Y")}#{d.strftime("%m")}#{d.strftime("%d")}"
    doc = Nokogiri::HTML.parse(open(input_url).read)
  
    teams = doc.css(".yjMS.bb").map { |e| e.text }
    scores = doc.css(".score_r").map { |e| e.text.to_i }
    status = doc.css("td.yjMSt").map { |e| e.text }
  
    result_list = []
  
    status.size.times.with_index do |i|
      result_list << { home_team: teams[i * 2],
                       home_score: scores[i * 2],
                       away_team: teams[i * 2 + 1], 
                       away_score: scores[i * 2 + 1], 
                       status: status[i] }
    end
    select_team(result_list, team)
  end

  private

  def self.select_team(all_result, team)
    if team
      team_result = all_result.select { |game| game[:home_team] == team || game[:away_team] == team }
    else
      all_result
    end
  end
end
