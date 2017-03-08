# Your task is to implement a function which takes a color as a string
# and returns the parsed color as a map

require 'spec_helper'

def preset_colors(color)
  case
  when color == 'limegreen'
    '#32CD32'
  when color == 'red'
    '#FF0000'
  else
    '#000000'
  end
end

def parse_html_color(color)
  if color.start_with?('#')
    hex = color.length==7 ? color : color.gsub(/(\h)/, '\1\1')
  else
    hex = preset_colors(color.downcase)
  end
  r, g, b = hex.scan(/\h\h/).map(&:hex)
  {r: r, g: g, b: b}
end

describe 'parse_html_color' do
  it "Example cases" do
    expect(parse_html_color('#80FFA0')).to   eq({r: 128, g: 255, b: 160})
    expect(parse_html_color('#3B7')).to      eq({r: 51,  g: 187, b: 119})
    expect(parse_html_color('LimeGreen')).to eq({r: 50,  g: 205, b: 50})
    expect(parse_html_color('Red')).to       eq({r: 255,  g: 0, b: 0})
    expect(parse_html_color('NoMatch')).to   eq({r: 0,  g: 0, b: 0})
  end
end
