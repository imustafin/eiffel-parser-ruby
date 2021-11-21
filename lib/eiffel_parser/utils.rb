# frozen_string_literal: true

module EiffelParser
  # General parsing utils
  module Utils
    def depth(line)
      line.chars.take_while { |x| x == "\t" }.count
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
  end
end
