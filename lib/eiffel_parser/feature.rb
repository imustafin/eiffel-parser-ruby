# frozen_string_literal: true

module EiffelParser
  # Representation of Eiffel feature
  class Feature
    include Utils

    def initialize(signature, lines)
      @signature = signature
      @tree = parse_tree(lines)
    end

    def name
      @signature.split.first.strip.chomp(":")
    end

    def body
      @tree
        .filter { |k, _v| k.start_with?("do") }
        .first
        .last
        .map(&:rstrip)
    end
  end
end
