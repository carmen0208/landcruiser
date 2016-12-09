require 'spec_helper'
require_relative '../lib/robot'

describe Robot do
  let(:x) {"1"}
  let(:y) {"3"}
  let(:y_over) { "0" }
  let(:facing) {"SOUTH"}
  let(:wrong_facing) { "ME" }
  let(:over_max_x_y) { "9" }
  let(:robot) { Robot.new(x,y,facing) }
  let(:robot_fall) { Robot.new(x,y_over,facing) }
  let(:directions) { ['NORTH','EAST','SOUTH','WEST'] }

  context "Initialize Robot" do
    it 'returns a Robot instance' do
      expect(Robot.new(x,y,facing)).to be_a Robot
    end

    context "With wrong params:" do
      it "Direction" do
        expect { Robot.new(x, y, wrong_facing) }.to raise_error("You much choose face to NORTH,SOUTH,EAST,WEST")
      end

      it "Cordination" do
        expect { Robot.new(x, over_max_x_y, facing)  }.to raise_error("Coordinate must be choosen the integer beween 0 to 5")
      end

    end
  end
  context 'Action:' do
        it "LEFT" do
          expect(robot.left).to eq ['EAST','SOUTH','WEST','NORTH']

        end

        it "RIGHT" do
          expect(robot.right).to eq ['WEST','NORTH','EAST','SOUTH']
        end

        it "MOVE in table" do
          expect(robot.move).to eq 2
        end

        it "MOVE out of table" do
          expect {robot_fall.move }.to raise_error("Hey, You would fall, I saved your ass, don't do it again")
        end
      end

      it "Show Location" do
          expect(robot.location).to eq '1,3,SOUTH'

      end
end
