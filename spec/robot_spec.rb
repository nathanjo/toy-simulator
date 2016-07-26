require 'spec_helper'

describe 'Robot' do

  let(:robot) {Robot.new}

  context 'commands' do
    it 'correct instruction' do
      expect(robot.commands(:move)).to be_truthy
    end

    it 'not correct instruction' do
      expect(robot.commands(:moves)).to be_falsy
    end
  end

  context 'coordinates' do
    it 'returns values' do
      expect(robot.coordinates(:north)).to be_a(Hash)
    end

    it 'return nil' do
      expect(robot.coordinates(:norths)).to eq(nil)
    end
  end

  context 'orientation' do
    it 'returns correct facing' do
      expect(robot.orientation(:north)).to be_a(Hash)
    end

    it 'returns nil' do
      expect(robot.orientation(:norths)).to eq(nil)
    end
  end
end