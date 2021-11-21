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
        .find { |k, _v| k.start_with?("do") }
        .last
        .map(&:rstrip)
    end

    def note
      clause = @tree
        .find { |k, _v| k.start_with?("note") }

      return unless clause

      lines = clause.last

      lines
        .map { |l| l.split(":", 2).map(&:strip) }
        .to_h
    end
  end
end
