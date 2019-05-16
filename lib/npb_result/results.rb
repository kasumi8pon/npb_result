module NpbResult
  class Results
    attr_reader :size
    include Enumerable

    def initialize(date: Date.today)
      @date = date

      doc = read_url(date)
      away_team = away_team(doc)
      away_score = away_score(doc)
      home_team = home_team(doc)
      home_score = home_score(doc)
      status = status(doc)
      start_time = start_time(doc)

      @size = status.size
      @results = []

      @size.times do |i|
        @results << Game.new(
          away_team[i], away_score[i],
          home_team[i], home_score[i],
          status[i], start_time[i]
        )
      end
    end

    def select_team(team)
      selected_team = @results.select { |game| game.home_team == team || game.away_team == team }
      selected_team ? selected_team[0] : nil
    end

    def display
      if @results.empty?
        "試合なし"
      else
        inject("") do |display, result|
          display << "【#{result.status}】#{result.away_team} (#{result.away_score})" \
                    " - (#{result.home_score}) #{result.home_team}\n"
        end
      end
    end

    def each
      @results.each { |result| yield(result) }
    end

    def [](idx)
      @results[idx]
    end

    private

    def read_url(date)
      d = date
      input_url = "https://baseball.yahoo.co.jp/npb/schedule/?date=" \
                  "#{d.strftime("%Y")}#{d.strftime("%m")}#{d.strftime("%d")}"
      Nokogiri::HTML.parse(open(input_url).read)
    end

    def away_team(doc)
      doc.css(".yjMS.bb").map(&:text).select.with_index { |_, i| i.even? }
    end

    def home_team(doc)
      doc.css(".yjMS.bb").map(&:text).select.with_index { |_, i| i.odd? }
    end

    def away_score(doc)
      doc.css(".score_r").map(&:text).map(&:to_i).select.with_index { |_, i| i.even? }
    end

    def home_score(doc)
      doc.css(".score_r").map(&:text).map(&:to_i).select.with_index { |_, i| i.odd? }
    end

    def status(doc)
      doc.css("td.yjMSt").map(&:text)
    end

    def start_time(doc)
      times = doc.css("td.yjSt.bl em").map(&:text).map { |e| e.split(":") }
      d = @date
      times.map do |time|
        Time.new(d.strftime("%Y"), d.strftime("%m"), d.strftime("%d"), time[0], time[1])
      end
    end
  end
end
