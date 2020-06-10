File.open("./texts/text2", "a") do |file|
  3_000.times do
    rand(1..30).times { file.print rand(97..122).chr }
    file.print ' '
  end
end

File.open("./texts/text3", "a") do |file|
  25_000.times { file.print rand(97..122).chr }
end

File.open("./texts/text4", "a") do |file|
  25_000.times { file.print 'a' }
end
