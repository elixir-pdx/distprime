defmodule Collector do
  use GenServer

  def start_link(), do: GenServer.start_link(__MODULE__, [], name: __MODULE__)
  def init(_) do
    IO.puts "Collector init"
    {:ok, {10, []}}
  end

  def handle_cast({:primes_between, a, b, primes}, {n, so_far}) do
    {:noreply, {n, [{a,b,primes} | so_far] }}
  end

  # def handle_cast({:have_primes?, n})

end
