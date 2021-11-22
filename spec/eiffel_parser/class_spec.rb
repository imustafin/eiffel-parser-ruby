# frozen_string_literal: true

RSpec.describe EiffelParser::Class do
  subject(:cls) { described_class.new(lines) }

  let(:filename) { "#{File.dirname(__FILE__)}/application.e" }
  let(:lines) { File.open(filename).readlines }

  it "extracts feature names" do # rubocop:disable RSpec/ExampleLength
    expect(cls.features.map(&:name)).to contain_exactly(
      "attr",
      "make",
      "greet",
      "titleize"
    )
  end

  it "extracts class name" do
    expect(cls.name).to eq("APPLICATION")
  end
end
