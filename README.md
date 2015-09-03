__elixir-pdx/distprime__

---
#Overview

This exercise is designed to be an introduction to distributed Elixir programming.  This is a partial revisitation of a previous problem we solved together, but with a few additional twists.

The challenge is to write a distributed prime number generator/finder.  Such that you could request the Nth prime number and use multiple CPU cores and multiple computers to assist you in finding the answer.

We'll talk about strategies for how we might accomplish this before we begin.

**Prerequisites:**
* [elixir](http://elixir-lang.org/install.html)

---

#Getting Started

###Clone this repository.
	
	$ cd ~/Repositories
	$ git clone https://github.com/elixir-pdx/distprime.git
	$ cd distprime

#Hacking

You may find it helpful to play with your code in Elixir's `iex` interactive console. If you want to do that and autoload the console session with your code then you can do the following from the project root:

	$ iex -S mix

That will make sure that you're running `iex` inside your project's build environment.

#Building

To compile your project simply run this from the project root:

	$ mix compile

#Testing

To run the test suite defined in `test/distprime_test.exs` then run this from the project root:

	$ mix test

If you got your project bootstrapped correction you should see something like the following:

```
Called with 3
Called with 1
Called with 1000000
Called with 1000


  1) test nth_prime with 3 (DistPrimeTest)
     test/distprime_test.exs:8
     Assertion with == failed
     code: DistPrime.nth_prime(3) == 5
     lhs:  3
     rhs:  5
     stacktrace:
       test/distprime_test.exs:9



  2) test nth_prime with 1 (DistPrimeTest)
     test/distprime_test.exs:4
     Assertion with == failed
     code: DistPrime.nth_prime(1) == 2
     lhs:  1
     rhs:  2
     stacktrace:
       test/distprime_test.exs:5



  3) test nth_prime with 1000000 (DistPrimeTest)
     test/distprime_test.exs:16
     Assertion with == failed
     code: DistPrime.nth_prime(1000000) == 15485863
     lhs:  1000000
     rhs:  15485863
     stacktrace:
       test/distprime_test.exs:17



  4) test nth_prime with 1000 (DistPrimeTest)
     test/distprime_test.exs:12
     Assertion with == failed
     code: DistPrime.nth_prime(1000) == 7919
     lhs:  1000
     rhs:  7919
     stacktrace:
       test/distprime_test.exs:13



Finished in 0.03 seconds (0.03s on load, 0.00s on tests)
4 tests, 4 failures
```
