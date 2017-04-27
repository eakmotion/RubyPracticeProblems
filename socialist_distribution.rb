# You will be given two parameters, population and minimum: your goal is to
# give to each one according to his own needs (which we assume to be equal
# to minimum for everyone, no matter what), taking from the richest
# (bigger numbers) first.

require 'spec_helper'

def socialist_distribution(population, minimum)
  return [] if population.reduce(:+) < minimum * population.size
  while !population.all?{ |x| x >= minimum }
    idx_min = population.index(population.min)
    idx_max = population.index(population.max)
    population[idx_min] += 1
    population[idx_max] -= 1
  end
  population
end

describe 'socialist_distribution' do
  it 'Example cases' do
    expect(socialist_distribution([2,3,5,15,75],5))
      .to eq([5,5,5,15,70])
    expect(socialist_distribution([2,3,5,15,75],20))
      .to eq([20,20,20,20,20])
    expect(socialist_distribution([2,3,5,45,45],5))
      .to eq([5,5,5,42,43])
    expect(socialist_distribution([2,3,5,45,45],30))
      .to eq([])
    expect(socialist_distribution([24,48,22,19,37],30))
      .to eq([30,30,30,30,30])
  end
end
