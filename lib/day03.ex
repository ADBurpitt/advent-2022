defmodule Day03.Part1 do
  def solve(input) do
    input
  end
end

defmodule Day03.Part2 do
  def solve(input) do
    input
  end
end

defmodule Mix.Tasks.Day01 do
  use Mix.Task

  def run(_) do
    {:ok, input} = File.read("inputs/day03-input.txt")

    IO.puts("--- Part 1 ---")
    IO.puts(Day03.Part1.solve(input))
    IO.puts("")
    # IO.puts("--- Part 2 ---")
    # IO.puts(Day03.Part2.solve(input))
  end
end
