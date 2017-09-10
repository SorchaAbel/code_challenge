require 'spec_helper'
require 'pry'
require 'open-uri'
require 'nokogiri'

describe AnalyzePlay, vcr: true do
  before do
    @analyse_play = AnalyzePlay.new("http://www.ibiblio.org/xml/examples/shakespeare/macbeth.xml")
  end

  context '#parse_dom' do

    it 'should return a hash' do
      hash = @analyse_play.parse_dom
      expect(hash).to be_a_kind_of(Hash)
    end

    it 'should have valid data' do
      hash = @analyse_play.parse_dom
      expect(hash).to include("First Witch")
    end
  end
  context '#display_line_nos' do

    it 'should return line numbers and character names' do
      hash = @analyse_play.parse_dom
      output = @analyse_play.display_line_nos(hash)
      expect(output.keys).to include("Soldiers", "YOUNG SIWARD")

    end

    it 'should not have key "All"' do
      hash = @analyse_play.parse_dom
      output = @analyse_play.display_line_nos(hash)
      expect(output.keys).not_to include("ALL")
    end
  end
end