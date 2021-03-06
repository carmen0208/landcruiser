class ArgsFormat < Exception
end
class ParameterConvert
  def self.convert(args)
    raise ArgsFormat, "Command should begin with PLACE, ex: PLACE 0,0,NORTH MOVE REPORT MOVE" if args[0] != 'PLACE'
    @commands = []

    args.each_with_index do |arg, index|
      # puts "#{arg}, #{index}"
      case arg
      when 'PLACE'
        @commands << arg +" "+ args[index+1]
        args.delete_at(index+1)
      when 'LEFT','RIGHT','MOVE','REPORT'
        @commands << arg
      else
        # p arg
        raise ArgsFormat, "Are you kidding me? I need correct command to preform, ex: PLACE 0,0,NORTH MOVE REPORT MOVE"
      end
    end
    @commands
  end
end
