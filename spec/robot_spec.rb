require 'spec_helper'
require_relative '../lib/robot'

describe Robot do
  let(:x) {"1"}
  let(:y) {"3"}
  let(:facing) {"NORTH"}
  let(:wrong_facing) { "ME" }
  let(:over_max_x_y) { "9" }

  context "Initialize Robot" do
    it 'returns a Robot instance' do
      expect(Robot.new(x,y,facing)).to be_a Robot
    end
    context "With wrong params:" do
      it "Direction" do
        expect { Robot.new(x, y, wrong_facing) }.to raise_error("You much choose face to NORTH,SOUTH,EAST,WEST")
      end

      it "Cordination" do
        expect { Robot.new(x, over_max_x_y, facing)  }.to raise_error("Coordinate must choosing the integer beween 0 to 5")
      end

    end
  end
end
