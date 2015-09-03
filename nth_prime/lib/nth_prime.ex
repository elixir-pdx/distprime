defmodule PrimeWorker do
  use GenServer

  def start_link(), do: GenServer.start_link(__MODULE__,[])

  def init(_) do
    IO.puts "PrimeWorker init"
    {:ok, :state}
  end


  def handle_cast({:between, a, b, from}, state) do
    primes = primes_between(a,b)
    send from, {:primes_between, a,b, primes}
    {:noreply, state}
  end

  def primes_between(m,n) do
    Enum.filter(m..n,
                fn x -> is_prime?(x) end)
  end

  def is_prime?(0), do: false
  def is_prime?(1), do: true
  def is_prime?(2), do: true
  def is_prime?(n) do
    Enum.to_list(2..round(:math.sqrt(n)))
    |> Enum.any?(fn (x) -> rem(n,x) == 0 end)
    |> Kernel.not
  end

end
