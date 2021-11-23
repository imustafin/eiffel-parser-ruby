# frozen_string_literal: true

RSpec.describe EiffelParser::Class do
  subject(:cls) { described_class.new(lines) }

  let(:filename) { "#{File.dirname(__FILE__)}/#{file}" }
  let(:lines) { File.open(filename).readlines }

  describe "{APPLICATION}" do
    let(:file) { "application.e" }

    it "has name" do
      expect(cls.name).to eq("APPLICATION")
    end

    it "extracts feature names" do # rubocop:disable RSpec/ExampleLength
      expect(cls.features.map(&:name)).to contain_exactly(
        "attr",
        "make",
        "greet",
        "titleize"
      )
    end
  end

  describe "{BYTE_SEQUENCE}" do
    let(:file) { "byte_sequence.e" }

    it "has name" do
      expect(cls.name).to eq("BYTE_SEQUENCE")
    end

    it "extracts feature names" do
      expect(cls.features.map(&:name)).to contain_exactly(
        "get",
        "valid_index"
      )
    end
  end
end
