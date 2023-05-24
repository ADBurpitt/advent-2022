defmodule Day03.Part1 do
  def solve(input) do
    input
    |> String.split("\n", trim: true)
    |> Enum.map(&solve_line/1)
    |> Enum.sum()
  end

  def solve_line(line) do
    mid = String.length(line) |> div(2)

    String.split_at(line, mid)
    |> string_intersection
    |> List.first()
    |> Day03.Util.priority()
  end

  def string_intersection({str1, str2}) do
    set1 = str1 |> String.graphemes() |> MapSet.new()
    set2 = str2 |> String.graphemes() |> MapSet.new()

    MapSet.intersection(set1, set2) |> MapSet.to_list()
  end
end

defmodule Day03.Part2 do
  def solve(input) do
    input
    |> split_every_third_newline()
    |> Enum.map(&solve_group/1)
    |> Enum.sum()
  end

  def split_every_third_newline(input),
    do: Regex.split(~r/(.*?\n.*?\n.*?)\n/m, input, trim: true, include_captures: true)

  def string_intersection([str1, str2, str3]) do
    set1 = str1 |> String.graphemes() |> MapSet.new()
    set2 = str2 |> String.graphemes() |> MapSet.new()
    set3 = str3 |> String.graphemes() |> MapSet.new()

    MapSet.intersection(set1, set2)
    |> MapSet.intersection(set3)
    |> MapSet.to_list()
  end

  def solve_group(str) do
    str
    |> String.split("\n", trim: true)
    |> string_intersection()
    |> List.first()
    |> Day03.Util.priority()
  end
end

defmodule Day03.Util do
  def priority(<<char::utf8>> = _string) when char >= 97 and char <= 122, do: char - ?a + 1
  def priority(<<char::utf8>> = _string) when char >= 65 and char <= 90, do: char - ?A + 27
  def priority(_), do: 0
end

defmodule Mix.Tasks.Day03 do
  use Mix.Task

  def run(_) do
    {:ok, input} = File.read("inputs/day03.txt")

    IO.puts("--- Part 1 ---")
    IO.puts(Day03.Part1.solve(input))
    IO.puts("")
    IO.puts("--- Part 2 ---")
    IO.puts(Day03.Part2.solve(input))
  end
end
