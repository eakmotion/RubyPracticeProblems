# Your task is to code a UK driving license number using an Array of data.
# https://en.wikipedia.org/wiki/Driving_licence_in_the_United_Kingdom

require "spec_helper"
require "Date"

def driver(data)
  fname = data[0][0]
  mname = data[1][0] ? data[1][0] : '9'
  sname = data[2][0,5].upcase
  sname += '9'*(5-sname.size)

  fulldate = Date.parse(data[3])
  month = fulldate.month
  month += (data[4] == 'F') ? 50 : 0;
  month = (month < 10) ? '0'+month.to_s : month.to_s
  day = data[3][0,2]
  year = fulldate.year.to_s[2,2]

  sname + year[0] + month + day + year[1] + fname + mname + '9AA'
end

RSpec.describe "driver" do
  it "Example cases" do
    data_male = ["John","James","Smith","01-Jan-2000","M"]
    expect(driver(data_male)).to eq("SMITH001010JJ9AA")

    data_female = ["Johanna","","Gibbs","13-Dec-1981","F"]
    expect(driver(data_female)).to eq("GIBBS862131J99AA")
  end
end
