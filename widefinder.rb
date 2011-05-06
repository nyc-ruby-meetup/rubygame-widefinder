class WideFinder

  attr_accessor :filename

  def initialize(filename)
    @filename = filename
  end

  def results(count)
    store = {}
    File.open(@filename, 'r') do |f|
      f.each do |line|
        line =~ %r{"\w+\s([^\s]*?)(\?|\s)}
        store[$1] ||= 0
        store[$1] += 1
      end
    end

    store.sort { |a,b| b[1] <=> a[1] }[0...count].collect do |page, count|
      "#{count}: #{page}"
    end
  end

end
