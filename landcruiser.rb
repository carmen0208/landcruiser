require_relative 'lib/parameter_convert'
require_relative 'lib/robot'
## How to get the args from args and files???

args = []
if ARGV.empty?
  ARGF.each_line do |line|
    args += line.split
  end
else
  args = ARGV
end
# puts args


def perform(args)
  @err = STDOUT
  begin
  commands =  ParameterConvert.convert(args)
  rescue ArgsFormat => e
    @err.puts e.message
    return @err
  end

  commands.each do |command|
     case command
       when /^PLACE/
        #  puts "Placed"
         x, y, face = command.split(" ")[1].split(",")
         begin
           @robot = Robot.new(x, y, face)
         rescue => e
           @err.puts e.message
           return @err
         end
       when 'LEFT'
         # puts "left: #{command}"
         @robot.left
       when 'RIGHT'
         # puts "right: #{command}"
         @robot.right
       when 'MOVE'
         # puts "move: #{command}"
         begin
         @robot.move
         rescue WrongPositionError => e
           @err.puts e.message
         end
       when 'REPORT'
         # puts "report: #{command}"
         @robot.location
     end
  end
end

perform(args)
