# Create a little script to calculate the best possible value.
# The function takes two arguments :

# points : an array of integer representing for each letters from A to Z
#          the points that it pays
# words : an array of strings, uppercase

# You must return the index of the shortest word which realize the highest score.



require 'spec_helper'

points = [1, 3, 3, 2, 1, 4, 2, 4, 1, 8, 10, 1, 2, 1, 1, 3, 8, 1, 1, 1, 1, 4, 10, 10, 10, 10]

def get_best_word(points, words)
  r = words.group_by { |e| e.chars.reduce(0) { |a, e| a + points[e.ord - 'A'.ord] }}
           .max[1]
           .min { |a, b| a.size <=> b.size }
  words.index r
end

describe 'get_best_word' do
  it 'Example cases' do
    expect(get_best_word(points, ["WHO","IS","THE","BEST","OF","US"]))
      .to eq(0)
    expect(get_best_word(points, ["AABCDEF", "WHO","IS","THE","BEST","OF","US"]))
      .to eq(1)
    expect(get_best_word(points, ["NOQ","TXAY","S","OM","ESFT","CJUKQ","QL","QO","ASTK","Y"]))
      .to eq(5)
    expect(get_best_word(points, ["N","AO","TQGZW","P","OBTP","CLWXB","Y","JQGFJ","Q","RP","OC","MRQCZ","ZWN","ZRT","OIRYH","GWPMSZP","LQRYUKQ","LBM","LFEI","VHUX","RTALLIC","JEMUPS","XUW","X","ZLXFMWS","LFAGR","HJ","RTUAI","JRBNG","ZUYSC","CIEYV","FUY","B","EJS","CINBTQS","JEAC","JX","LLILSEK","W","KLUV"]))
      .to eq(16)
  end
end
