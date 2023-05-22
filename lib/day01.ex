defmodule Day01.Part1 do
  def solve(input) do
    input
    |> String.split("\n\n", trim: true)
    |> Enum.map(&sum_calories/1)
    |> Enum.max()
  end

  def sum_calories(cals) do
    cals
    |> String.split("\n", trim: true)
    |> Enum.reduce(0, fn cal, acc -> String.to_integer(cal) + acc end)
  end
end

defmodule Day01.Part2 do
  def solve(input) do
    input
    |> String.split("\n\n", trim: true)
    |> Enum.map(&Day01.Part1.sum_calories/1)
    |> Enum.sort()
    |> Enum.take(-3)
    |> Enum.sum()
  end
end

defmodule Mix.Tasks.Day01 do
  use Mix.Task

  def run(_) do
    {:ok, input} = File.read("inputs/day01.txt")

    IO.puts("--- Part 1 ---")
    IO.puts(Day01.Part1.solve(input))
    IO.puts("")
    IO.puts("--- Part 2 ---")
    IO.puts(Day01.Part2.solve(input))
  end
end
