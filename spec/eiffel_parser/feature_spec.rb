# frozen_string_literal: true

RSpec.describe EiffelParser::Feature do
  subject(:feature) { cls.features.find { |f| f.name == feature_name } }

  let(:cls) { EiffelParser::Class.new(lines) }
  let(:filename) { "#{File.dirname(__FILE__)}/application.e" }
  let(:lines) { File.open(filename).readlines }

  describe "{APPLICATION}.attr" do
    let(:feature_name) { "attr" }

    it "has name" do
      expect(feature.name).to eq("attr")
    end

    it "has no body" do
      expect(feature.body).to be_nil
    end
  end

  describe "{APPLICATION}.make" do
    let(:feature_name) { "make" }

    it "has name" do
      expect(feature.name).to eq("make")
    end

    it "has body lines" do
      expect(feature.body).to contain_exactly(
        'greet ("world")',
        'greet ("")'
      )
    end

    it "doesn't have note clause" do
      expect(feature.note_clause).to be_nil
    end
  end

  describe "{APPLICATION}.greet" do
    let(:feature_name) { "greet" }

    it "has name" do
      expect(feature.name).to eq("greet")
    end

    it "has body lines" do # rubocop:disable RSpec/ExampleLength
      expect(feature.body).to contain_exactly(
        "if a_name.is_empty then",
        "\tfull_message := \"Hello!\"",
        "else",
        "\tfull_message := \"Hello, \" + titleize (a_name) + \"!\"",
        "end",
        "print (full_message + \"%N\")"
      )
    end

    it "has note clause" do
      expect(feature.note_clause).to eq(
        "string_note" => '"str"'
      )
    end
  end

  describe "{APPLICATION}.titleize" do
    let(:feature_name) { "titleize" }

    it "has name" do
      expect(feature.name).to eq("titleize")
    end

    it "has require clause with correct count" do
      expect(feature.require_clause.count).to eq(1)
    end

    it "has local clause with correct count" do
      expect(feature.local_clause.count).to eq(1)
    end

    it "has ensure clause with correct count" do
      expect(feature.ensure_clause.count).to eq(2)
    end
  end
end
