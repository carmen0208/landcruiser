require_relative '../lib/parameter_convert'
describe ParameterConvert do
  context 'with invalid parameter' do
    let(:begin_without_place) { ['X,Y,facing','kkk','whatever','STOP','BUMP','MOVE'] }
    it 'Command not begin with PLACE' do
      expect(ParameterConvert.convert(begin_without_place)).to eq("Command should begin with PLACE, ex: PLACE 0,0,NORTH MOVE REPORT MOVE")
    end
    let(:invlid_parms) { ['PLACE','X,Y,facing','kkk','whatever','STOP','BUMP','MOVE'] }
    it 'Command with invalid numbers' do
      expect(ParameterConvert.convert(invlid_parms)).to eq("Are you kidding me? I need the command to preform, ex: PLACE 0,0,NORTH MOVE REPORT MOVE")
    end
  end

  context 'with valid parameter' do
    let(:args) { ['PLACE','X,Y,facing','MOVE','MOVE','LEFT','RIGHT','REPORT'] }
    let(:output_commands) {ParameterConvert.convert(args)}
    it 'PLACE should combine with cordination' do

      expect(output_commands[0]).to eq("PLACE X,Y,facing")
    end
    it 'return should include LEFT' do
      expect(output_commands.include?('LEFT')).to be true
    end
    it 'return should include MOVE' do
      expect(output_commands.include?('MOVE')).to be true
    end
    it 'return should include RIGHT' do
      expect(output_commands.include?('RIGHT')).to be true
    end
    it 'return should include REPORT' do
      expect(output_commands.include?('REPORT')).to be true
    end
  end
end
