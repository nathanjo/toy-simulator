require 'spec_helper'

describe Robot do

  let(:robot) {Robot.new}

  subject { robot.facing(:north) }

  left = {north: :west, south: :east, east: :north, west: :south}
  right = {north: :east, south: :west, east: :south, west: :north}
  
  coord_north = {:x => 0, :y => 1}
  coord_south = {:x => 0, :y => -1}
  coord_east = {:x => 1, :y => 0}
  coord_west = {:x => -1, :y => 0}

  context 'orientation' do

    it 'should have orientation accesor' do
      expect(robot.facing(:north)).not_to eq(nil)
    end

    it 'has incorrect orientation' do
      expect(robot.facing(:norths)).to eq(nil)
    end

    it 'should give correct left orientation' do
      subject
      expect(robot.left).to eq(left[:north])
    end

    it 'should give correct right orientation' do
      subject
      expect(robot.right).to eq(right[:north])
    end

  end

  context 'coordinates' do

    it 'returns hash coordinates' do
      subject
      expect(robot.coordinates).to be_a(Hash)
    end

    it 'returns correct coordinates based by orientation' do
      subject
      expect(robot.coordinates).to eq(coord_north)
    end

    it 'returns incorrect coordinates based by orientation' do
      subject
      expect(robot.coordinates).not_to eq(coord_east)
    end
  end
end