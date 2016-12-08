
## How to get the args from args and files???

args = []
if ARGV.empty?
  ARGF.each_line do |line|
    args += line.split
  end
else
  args = ARGV
end

puts args
