RSpec.describe NpbResult do
  it "has a version number" do
    expect(NpbResult::VERSION).not_to be nil
  end

  it "has no result on April 4th, 2019" do
    date = Date.new(2019,4,1)
    expect(NpbResult.display(date: date)).to eq("試合なし")
  end
end
