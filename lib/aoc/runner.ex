defmodule Aoc.Runner do
  use GenServer

  alias Aoc.Util.FileLoader

  @runners %{
    1 => Aoc.Tasks.SortList,
    2 => Aoc.Tasks.ReactorReport,
    3 => Aoc.Tasks.Multiplier
  }

  def child_spec(_args) do
    %{
      id: __MODULE__,
      start: {__MODULE__, :start_link, []}
    }
  end

  def start_link do
    GenServer.start_link(__MODULE__, nil, name: via_tuple())
  end

  def init(_) do
    {:ok, nil}
  end

  def handle_call({:run, day}, _from, state) do
    result = run_tasks_for_day(day)
    {:reply, result, state}
  end

  def run_day(day_number) do
    GenServer.call(via_tuple(), {:run, day_number})
  end

  defp run_tasks_for_day(day_number) do
    module = @runners[day_number]
    {task1, task2} = module.runners()

    data = FileLoader.load(day_number)
    output1 = task1.(data)
    output2 = task2.(data)

    %Aoc.Result{task1: output1, task2: output2, day: day_number}
  end

  defp via_tuple do
    Aoc.Registry.via_tuple(__MODULE__)
  end
end
