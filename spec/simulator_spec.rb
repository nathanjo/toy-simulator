require 'spec_helper'

describe Simulator do

  let(:robot) {Robot.new}
  let(:simulator) {Simulator.new}

  context 'arguments' do

    it 'should prcocess the PLACE command' do
      expect(simulator.execute("PLACE 1,2,NORTH")).not_to eq([true, "Requires to initialize Place first"])
    end

    it 'should accept other commands after a valid place' do
      simulator.execute("PLACE 1,2,NORTH")
      expect(simulator.execute("MOVE")).not_to eq([true, "Requires to initialize Place first"])
    end

    it 'should not accept commands not in a list' do
      simulator.execute("PLACE 1,2,NORTH")
      expect(simulator.execute("MOVES")).not_to eq([true, "Requires to initialize Place first"])
    end

    it 'should not accept other commands without valid place' do
      expect(simulator.execute("MOVE")).to eq([true, "Requires to initialize Place first"])
    end

    it 'should not accept other commands without valid place' do
      expect(simulator.execute("LEFT")).to eq([true, "Requires to initialize Place first"])
    end

    it 'should not accept other commands for out of range' do
      simulator.execute("PLACE 5,2,NORTH")
      expect(simulator.execute("LEFT")).to eq([true, "Requires to initialize Place first"])
    end
  end
end