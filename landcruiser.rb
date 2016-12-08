require_relative 'lib/parameter_convert'
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
  p ParameterConvert.convert(args)
  rescue ArgsFormat => e
    @err.puts e.message
    return @err
  end
end

perform(args)
