# frozen_string_literal: true

module DP
  class LongestCommonSubsequence
    def initialize(a, b)
      @a = a
      @b = b
      # Header + Length + 0/0 row + string + margin - (Length + 0/0 row + string) * 2 + margin.
      @display = Display.new(2 + a.length + 2 + 4, (b.length + 2) * 2 + 4)
    end

    def solve
      max = ->(x, y) { x > y ? x : y }
      m = @a.length
      n = @b.length
      oo = 0
      dp = (0..m).map { (0..n).map { oo } }
      print_table(dp, 0, 0)

      (1..m).each do |i|
        (1..n).each do |j|
          dp[i][j] = @a[i - 1] == @b[j - 1] ? 1 + dp[i - 1][j - 1] : max.(dp[i - 1][j], dp[i][j - 1])
          print_table(dp, i, j)
        end
      end

      dp[m][n]
    end

    def print_table(dp, i, j)
      x = 2
      y = 2

      # Print header.
      @display.position(x, y)
      @display.append("LCS. Rows: #{i}, #{j}")

      # Print top row.
      x = 4
      @display.position(x, y)
      @display.append("  #{@b}".chars.map { |chr| " #{chr}" }.join)

      # Display all rows
      prefixes = " #{@a}".chars.map { |chr| " #{chr}" }
      table = dp.map { |row| row.map { |num| " #{num}" }.join }
      rows = prefixes.zip(table).map { |prefix, row| "#{prefix}#{row}" }

      rows.each do |row|
        x += 1
        @display.position(x, y)
        @display.append(row)
      end

      @display.prompt
    end

    def close
      @display.close
    end
  end
end
