# frozen_string_literal: true

module DP
  class LongestCommonSubsequence
    def initialize(a, b)
      @a = a
      @b = b
      # Length + 0/0 row + string + margin - (Length + 0/0 row + string) * 2 + margin.
      @display = Display.new(a.length + 2 + 4, (b.length + 2) * 2 + 4)
    end

    def solve
      max = ->(x, y) { x > y ? x : y }
      m = @a.length
      n = @b.length
      oo = 0
      dp = (0..m).map { (0..n).map { oo } }
      print_table(dp)

      (1..m).each do |i|
          (1..n).each do |j|
              dp[i][j] = @a[i - 1] == @b[j - 1] ? 1 + dp[i - 1][j - 1] : max.(dp[i - 1][j], dp[i][j - 1])
              print_table(dp)
          end
      end

      dp[m][n]
    end

    def print_table(dp)
      @display.reset_position

      top = "  #{@a}".chars.map { |chr| " #{chr}" }.join
      prefixes = " #{@b}".chars.map { |chr| " #{chr}" }

      table = dp.map { |row| row.map { |num| " #{num}" }.join }
      rows = prefixes.zip(table).map { |prefix, row| "#{prefix}#{row}" }

      @display.append([top] + rows)
      sleep(2)
    end

    def close
      @display.close
    end
  end
end
