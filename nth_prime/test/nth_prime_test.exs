defmodule PrimeWorkerTest do
  use ExUnit.Case

  test "primes_between" do
    assert PrimeWorker.primes_between(1,15) == [1,2,3,5,7]
  end
end
