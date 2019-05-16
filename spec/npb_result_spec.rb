RSpec.describe NpbResult do
  it "has a version number" do
    expect(NpbResult::VERSION).not_to be nil
  end

  it "has no game on April 4th, 2019" do
    date = Date.new(2019, 4, 1)
    expect(NpbResult::Results.new(date: date).display).to eq("試合なし")
  end

  it "has 6 game on April 4th, 2019" do
    date = Date.new(2019, 4, 2)
    expect(NpbResult::Results.new(date: date).size).to eq(6)
  end

  it "has a game of 阪神(3) - 巨人(9) on April 4th, 2019" do
    date = Date.new(2019, 4, 2)
    game = NpbResult::Results.new(date: date).first
    expect(game.away_team).to eq("阪神")
    expect(game.away_score).to eq(3)
    expect(game.home_team).to eq("巨人")
    expect(game.home_score).to eq(9)
    expect(game.status).to eq("結果")
    start_time = Time.new(2019, 4, 2, 18, 0)
    expect(game.start_time).to eq(start_time)
  end

  it "has a game of オリックス on April 4th, 2019" do
    date = Date.new(2019, 4, 2)
    game = NpbResult::Results.new(date: date).select_team("オリックス")
    expect(game.away_team).to eq("ソフトバンク")
    expect(game.away_score).to eq(11)
    expect(game.home_team).to eq("オリックス")
    expect(game.home_score).to eq(4)
    expect(game.status).to eq("結果")
    start_time = Time.new(2019, 4, 2, 18, 0)
    expect(game.start_time).to eq(start_time)
  end
end
