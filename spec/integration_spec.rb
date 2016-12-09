describe 'Integration' do
  describe "From Command Line" do
    let (:output) { `ruby landcruiser.rb #{commands}` }
    context 'PLACE 0,0,NORTH MOVE REPORT' do
      let (:commands) { 'PLACE 0,0,NORTH MOVE REPORT' }
      it 'RETURNS' do
        expect(output).to eq "\"0,1,NORTH\"\n"
      end
    end

    context 'PLACE 0,0,NORTH LEFT REPORT' do
      let (:commands) { 'PLACE 0,0,NORTH LEFT REPORT' }
      it 'RETURNS' do
        expect(output).to eq "\"0,0,WEST\"\n"
      end
    end

    context 'PLACE 1,2,EAST MOVE MOVE LEFT MOVE REPORT' do
      let (:commands) { 'PLACE 1,2,EAST MOVE MOVE LEFT MOVE REPORT' }
      it 'RETURNS' do
        expect(output).to eq "\"3,3,NORTH\"\n"
      end
    end
  end

  describe "From File" do
    let (:output) { `ruby landcruiser.rb < #{commands}` }
    context 'rock.txt' do
      let (:commands) { 'rock.txt' }
      it 'succeed' do
        expect(output).to eq "\"2,2,NORTH\"\n"
      end
    end

    context 'not-rock.txt' do
      let (:commands) { 'not-rock.txt' }
      it 'succeed' do
        expect(output).to eq "Are you kidding me? I need correct command to preform, ex: PLACE 0,0,NORTH MOVE REPORT MOVE\n"
      end
    end

    context 'crazy.txt' do
      let (:commands) { 'crazymouse.txt' }
      it 'succeed' do
        expect(output).to be_a String
      end
    end
  end
end
