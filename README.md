# ghc-t21141

A reproducer for [GHC#21141](https://gitlab.haskell.org/ghc/ghc/-/issues/21141). To observe the crash on Linux, run:

```
$ cabal run test:ghc-t21141 -w ghc-9.0.2 -- --seed=1065015581
Up to date

A
  B
    identity [✔]
      +++ OK, passed 100 tests.
    should throw an Underflow exception on negative inputs [ ]Segmentation fault (core dumped)
```

Note that the crash does _not_ occur on GHC 8.10.7 or 9.2.1:

```
$ cabal run test:ghc-t21141 -w ghc-8.10.7 -- --seed=1065015581
Resolving dependencies...
Build profile: -w ghc-8.10.7 -O1
In order, the following will be built (use -v for more details):
 - ghc-t21141-0.1.0.0 (test:ghc-t21141) (file README.md changed)
Preprocessing test suite 'ghc-t21141' for ghc-t21141-0.1.0.0..
Building test suite 'ghc-t21141' for ghc-t21141-0.1.0.0..

A
  B
    identity [✔]
      +++ OK, passed 100 tests.
    should throw an Underflow exception on negative inputs [✔]
      +++ OK, passed 100 tests.

Finished in 0.0019 seconds
2 examples, 0 failures

$ cabal run test:ghc-t21141 -w ghc-9.2.1 -- --seed=1065015581
Resolving dependencies...
Build profile: -w ghc-9.2.1 -O1
In order, the following will be built (use -v for more details):
 - ghc-t21141-0.1.0.0 (test:ghc-t21141) (file README.md changed)
Preprocessing test suite 'ghc-t21141' for ghc-t21141-0.1.0.0..
Building test suite 'ghc-t21141' for ghc-t21141-0.1.0.0..

A
  B
    identity [✔]
      +++ OK, passed 100 tests.
    should throw an Underflow exception on negative inputs [✔]
      +++ OK, passed 100 tests.

Finished in 0.0012 seconds
2 examples, 0 failures
```
