# You will be strengthening your page-fu mastery.
# You will complete the PaginationHelper class, which is a utility class
# helpful for querying paging information related to an array.

# The class is designed to take in an array of values and an integer indicating
# how many items will be allowed per each page. The types of values contained
# within the collection/array are not relevant.

require 'spec_helper'

class PaginationHelper
  attr_reader :collection, :items_per_page

  # The constructor takes in an array of items and a integer indicating how many
  # items fit within a single page
  def initialize(collection, items_per_page)
    @collection = collection
    @items_per_page = items_per_page
  end

  # returns the number of items within the entire collection
  def item_count
    @collection.size
  end

  # returns the number of pages
  def page_count
    (item_count.to_f / items_per_page).ceil
  end

  # returns the number of items on the current page. page_index is zero based.
  # this method should return -1 for page_index values that are out of range
  def page_item_count(page_index)
    i = collection[page_index * items_per_page...page_index * items_per_page + items_per_page]
    i ? i.size : -1
  end

  # determines what page an item is on. Zero based indexes.
  # this method should return -1 for item_index values that are out of range
  def page_index(item_index)
    return -1 unless (0...item_count).include? item_index
    page = item_index / items_per_page
  end
end

RSpec.describe "" do
  it "Example cases" do
    helper = PaginationHelper.new(['a','b','c','d','e','f'], 4)
    expect(helper.page_count).to eq(2)
    expect(helper.item_count).to eq(6)
    expect(helper.page_item_count(0)).to eq(4)
    expect(helper.page_item_count(1)).to eq(2)
    expect(helper.page_item_count(2)).to eq(-1)
    expect(helper.page_index(5)).to eq(1)
    expect(helper.page_index(2)).to eq(0)
    expect(helper.page_index(20)).to eq(-1)
    expect(helper.page_index(-10)).to eq(-1)
  end
end
