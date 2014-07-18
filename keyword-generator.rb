require 'pry'
require 'yaml'
#File.read()
# binding.pry

keywords_started = false
keywords = Hash.new
File.open('defs/keywords', 'r').each_line do |line|
  
  if keywords_started 
    # end this if %% found
    if line.include?('%%')
      keywords_started = false 
      next
    end

    keyword = line.split(',').first
    keywords[keyword] = ''
  else
    keywords_started = true if line.include?('%%')
  end
end

File.open("keyword_translation.yml", 'w+') do |f|
  f.write( keywords.to_yaml )
end
