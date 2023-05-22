defmodule Day02.Part1 do
  @shape_scores %{
    "X" => 1,
    "Y" => 2,
    "Z" => 3
  }

  @outcome_score %{
    "A" => %{
      "X" => 3,
      "Y" => 6,
      "Z" => 0
    },
    "B" => %{
      "X" => 0,
      "Y" => 3,
      "Z" => 6
    },
    "C" => %{
      "X" => 6,
      "Y" => 0,
      "Z" => 3
    }
  }

  def solve(input) do
    input
    |> String.split("\n", trim: true)
    |> Enum.map(&score_round/1)
    |> Enum.sum()
  end

  def score_round(round) do
    [shape1, shape2] = String.split(round, " ", trim: true)

    @shape_scores[shape2] + @outcome_score[shape1][shape2]
  end
end

defmodule Day02.Part2 do
  @outcomes %{
    "A" => %{
      "X" => 3,
      "Y" => 4,
      "Z" => 8
    },
    "B" => %{
      "X" => 1,
      "Y" => 5,
      "Z" => 9
    },
    "C" => %{
      "X" => 2,
      "Y" => 6,
      "Z" => 7
    }
  }

  def solve(input) do
    input
    |> String.split("\n", trim: true)
    |> Enum.map(&score_round/1)
    |> Enum.sum()
  end

  def score_round(round) do
    [shape1, shape2] = String.split(round, " ", trim: true)

    @outcomes[shape1][shape2]
  end
end

defmodule Mix.Tasks.Day02 do
  use Mix.Task

  def run(_) do
    {:ok, input} = File.read("inputs/day02.txt")

    IO.puts("--- Part 1 ---")
    IO.puts(Day02.Part1.solve(input))
    IO.puts("")
    IO.puts("--- Part 2 ---")
    IO.puts(Day02.Part2.solve(input))
  end
end
