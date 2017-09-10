require 'pry'
require 'open-uri'
require 'nokogiri'

class AnalyzePlay
  @dom = nil

  def initialize(play_url)
    @dom = Nokogiri::HTML(open(play_url))

  end

  def parse_dom

    all_speakers = @dom.xpath("//speaker")

    actors_hash = all_speakers.each_with_object(Hash.new(0)) do |word,counts|
      counts[word.text.upcase] += 1 unless word.text.upcase == "ALL"
    end

    display_line_nos(actors_hash)
  end



  def display_line_nos(actors_hash)
    actors_hash.each {|key, value| puts "#{value} #{key}"}
  end

end