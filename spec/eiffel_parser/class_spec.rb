# frozen_string_literal: true

RSpec.describe EiffelParser::Class do
  subject(:cls) { described_class.new(lines) }

  let(:filename) { "#{File.dirname(__FILE__)}/application.txt" }
  let(:lines) { File.open(filename).readlines }

  it "extracts feature names" do
    expect(cls.features.map(&:first)).to contain_exactly(
      "make",
      "greet"
    )
  end

  it "extracts class name" do
    expect(cls.name).to eq("APPLICATION")
  end
end
