require "spec_helper"

def mod_str n,i
  n.to_s[-i..-1].to_i
end

def int_to_english(number)
  uu = %w"zero one two three four five six seven eight nine ten eleven twelve thirteen forteen fifteen sixteen seventeen eighteen nineteen"
  tt = %w"_ _ twenty thirty forty fifty sixty seventy eighty ninety"

  [[1e24,"septillion"],[1e21,"sextillion"],[1e18,"quintillion"],
   [1e15,"quadrillion"],[1e12,"trillion"],[1e9,"billion"],
   [1e6,"million"],[1e3,"thousand"],[100,"hundred"]].each{
    |m| if number > m[0] then return  (int_to_english((number/m[0]).to_i)+" "+m[1]+" "+int_to_english(mod_str(number,Math.log10(m[0]))) ).gsub(/ zero/,"") end
  }
  number < 1 ? "zero" : number < 20 ? uu[number] : tt[number/10]+" "+uu[number%10]
end

RSpec.describe "int_to_english" do
  it "Example cases" do
    expect(int_to_english(1)).to eq("one")
    expect(int_to_english(10)).to eq("ten")
    expect(int_to_english(25161045656)).to eq("twenty five billion one hundred sixty one million forty five thousand six hundred fifty six")
  end
end
