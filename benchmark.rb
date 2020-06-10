def benchmark algorithm, string, pattern, attempts_number
  results = {}
  time = []

  attempts_number.times do
    start = Time.now
    results[:indexes] = send(algorithm.to_sym, string, pattern)
    finish = Time.now
    time << finish - start
  end

  results[:avarage_time] = time.inject(0.0) { |sum, el| sum + el } / time.size

  return results
end
