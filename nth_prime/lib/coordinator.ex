defmodule Coordinator do
  use Application
  @x 4
  @chunk_size 1000

  # def start_link(n), do: Supervisor.start_link(__MODULE__, [])
  # def init([n]) do
  def start(_type, _args) do
    import Supervisor.Spec

    children = [worker(Collector, []) |
                 Enum.map((1..@x), fn _ -> worker(PrimeWorker, [], id: make_ref()) end)]

    opts = [strategy: :one_for_one]

    {:ok, sup} = Supervisor.start_link(children, opts)

    # [{}, id, {}, {}] =
    workers = Supervisor.which_children(sup)
    |> Enum.filter( fn {id, pid, type, [mod]} -> mod == PrimeWorker end )
    |> Enum.map( fn {id, pid, type, [mod]} -> pid end )

    IO.inspect workers

    # do_loop(workers)
    {:ok, sup}
  end

  def do_loop(kids) do
    # send chunks to workers
    i = 0
    chunk_starts = Enum.map(i..i+@x-1, fn x -> x * @chunk_size end)
    Enum.each(chunk_starts, fn x ->  end)
    IO.inspect chunk_starts


    # ask if we've found nth_prime
    # do_loop
  end
end

# results = [{a,b,primes} | so_far]
# if rem(List.length(results), @x) == 0 &&
#    have_result?(n, results)
