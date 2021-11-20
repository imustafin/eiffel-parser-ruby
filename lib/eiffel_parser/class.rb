# frozen_string_literal: true

module EiffelParser
  # Representation of Eiffel class
  class Class
    attr_reader :features

    def initialize(lines)
      global = parse_tree(lines)

      feature_blocks = global
        .filter { |k, _v| k.start_with?("feature") }
        .flat_map(&:last)

      feature_trees = parse_tree(feature_blocks)

      @features = feature_trees
        .map { |f| make_func(f.first, f.last) }
        .compact
    end

    private

    def make_func(signature, _lines)
      name = signature.split.first.strip.chomp(":")

      [name]
    end

    def parse_tree(lines) # rubocop:disable Metrics/MethodLength
      ans = []

      cur_key = nil
      cur_lines = []

      lines.each do |line|
        next if line.strip.empty?
        next if line.strip.start_with?("--")

        tabs = depth(line)

        if tabs.zero?
          ans << [cur_key, cur_lines] if cur_key

          cur_key = line.strip
          cur_lines = []

          next
        end

        cur_lines << line[1..line.size]
      end

      ans << [cur_key, cur_lines] if cur_key

      ans
    end

    def depth(line)
      line.chars.take_while { |x| x == "\t" }.count
    end
  end
end
