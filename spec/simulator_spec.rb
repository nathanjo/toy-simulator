require 'spec_helper'

describe Simulator do

  let(:robot) {Robot.new}
  let(:simulator) {Simulator.new}

  before do 
    allow(Robot).to receive(:new).and_return(robot)
    allow(Robot).to receive(:new).and_return(robot)
  end

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

  context 'coordinates and orientation' do

    subject { simulator.execute("PLACE 1,2,EAST") }

    it 'should move to left' do
      subject
      expect(simulator.left).to eq(:north)
    end

    it 'should move to right' do
      subject
      expect(simulator.right).to eq(:south)
    end

    it 'should not accept other commands if no valid PLACE is given' do
      simulator.execute("PLACES 5,2,NORTH")
      expect(simulator.left).to eq(nil)
    end

    it 'should return new position after MOVE command' do
      subject
      expect(simulator.move).to eq({x: 2, y: 2})
    end

    it 'should return new orientation' do
      subject
      simulator.move
      simulator.left
      expect(simulator.right).to eq(:east)
    end

    it 'should return REPORT' do
      subject
      simulator.execute("MOVE")
      simulator.execute("MOVE")
      simulator.execute("LEFT")
      simulator.execute("MOVE")
      expect(simulator.execute("REPORT")).to eq("Output: 3,3,NORTH")
    end
  end
end