require './algorithms.rb'
require './benchmark.rb'

algorithms = ['brute_search', 'kmp', 'karp_rabin']
ATTEMPTS_NUMBER  = 10

(1..4).each do |text_index|

  puts "============================ text#{text_index} ============================="

  File.open("./texts/text#{text_index}", "r") do |text|
    string = ''
    while line = text.gets
      string << line
    end

      
    algorithms.each do |algorithm|
      File.open("./texts/text#{text_index}_tests", "r") do |tests|
        File.open("./texts/text#{text_index}_#{algorithm}", "a") do |result_for_algorithm|
          while pattern = tests.gets
            unless pattern.empty?
              pattern.chomp!

              results = benchmark(algorithm, string, pattern, ATTEMPTS_NUMBER)
              
              result_for_algorithm.puts "<<#{pattern}>> #{results[:indexes].join(' ')}"
              result_for_algorithm.puts "#{ATTEMPTS_NUMBER} #{results[:avarage_time]}"
            end
          end
        end
      end
    end
  end
end
