# Rock Paper Scissors

require "spec_helper"

def rps(p1, p2)
  return 'Draw!' if p1 == p2
  result = win_map[p1.to_sym][p2.to_sym]
  "Player #{result} won!"
end

def win_map
  {
    rock:     { paper: 2, scissors: 1 },
    paper:    { scissors: 2, rock: 1 },
    scissors: { rock: 2, paper: 1 }
  }
end

RSpec.describe "rps" do
  it "Player 1 won" do
    expect(rps("rock", "scissors")).to eq("Player 1 won!")
    expect(rps("scissors", "paper")).to eq("Player 1 won!")
    expect(rps("paper", "rock")).to eq("Player 1 won!")
  end

  it "Player 2 won" do
    expect(rps("scissors", "rock")).to eq("Player 2 won!")
    expect(rps("paper", "scissors")).to eq("Player 2 won!")
    expect(rps("rock", "paper")).to eq("Player 2 won!")
  end
end
