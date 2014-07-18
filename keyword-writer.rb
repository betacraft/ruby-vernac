require 'yaml'

keywords = YAML::load_file('keyword_translation.yml')

lines = []
File.open('defs/keywords', 'r').each_line do |line|
  keyword = line.split(',').first
  value = keywords[keyword]
  
  lines.push(line)
  if value and value.length > 0
    lines.push(
      line.gsub(/^#{keyword}/, keywords[keyword])
    )
  end
end

puts lines.inspect
File.open('defs/keywords', 'w') do |file|
  file.puts lines
end
