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
      body_clause = @tree.find { |k, _v| k.start_with?("do") }

      return unless body_clause

      body_clause
        .last
        .map(&:rstrip)
    end

    def note_clause
      clause = @tree.find { |k, _v| k.start_with?("note") }

      return unless clause

      lines = clause.last

      lines
        .map { |l| l.split(":", 2).map(&:strip) }
        .to_h
    end

    def require_clause
      clause = @tree.find { |k, _v| k.start_with?("require") }

      return unless clause

      clause.last
    end

    def local_clause
      clause = @tree.find { |k, _v| k.start_with?("local") }

      return unless clause

      clause.last
    end

    def ensure_clause
      clause = @tree.find { |k, _v| k.start_with?("ensure") }

      return unless clause

      clause.last
    end
  end
end
