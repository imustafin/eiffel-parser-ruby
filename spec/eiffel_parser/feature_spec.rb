# frozen_string_literal: true

RSpec.describe EiffelParser::Feature do
  let(:cls) { EiffelParser::Class.new(lines) }
  let(:filename) { "#{File.dirname(__FILE__)}/application.txt" }
  let(:lines) { File.open(filename).readlines }

  describe "{APPLICATION}.make" do
    subject(:feature) { cls.features.find { |f| f.name == "make" } }

    it "has name" do
      expect(feature.name).to eq("make")
    end

    it "has body lines" do
      expect(feature.body).to contain_exactly(
        'greet ("World")',
        'greet ("")'
      )
    end
  end

  describe "{APPLICATION}.greet" do
    subject(:feature) { cls.features.find { |f| f.name == "greet" } }

    it "has name" do
      expect(feature.name).to eq("greet")
    end

    it "has body lines" do # rubocop:disable RSpec/ExampleLength
      expect(feature.body).to contain_exactly(
        "if a_name.is_empty then",
        "\tfull_message := \"Hello!\"",
        "else",
        "\tfull_message := \"Hello, \" + a_name + \"!\"",
        "end",
        "print (full_message + \"%N\")"
      )
    end
  end
end
