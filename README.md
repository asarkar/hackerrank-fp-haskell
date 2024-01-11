My solutions to [HackerRank Functional Programming code challenges](https://www.hackerrank.com/domains/fp).

[![](https://github.com/asarkar/hackerrank-fp-haskell/workflows/CI/badge.svg)](https://github.com/asarkar/hackerrank-fp-haskell/actions)

## Index

### Introduction

* [Filter Array](problems/Introduction/FilterArray.pdf) - [Solution](src/Introduction/FilterArray.hs)

* [Hello World N Times](problems/Introduction/HelloWorldN.pdf) - [Solution](src/Introduction/HelloWorldN.hs)

### Recursion

* [Sequence full of colors](problems/Recursion/ColorSeq.pdf) - [Solution](src/Recursion/ColorSeq.hs)

* [Convex Hull](problems/Recursion/ConvexHull.pdf) - [Solution](problems/Recursion/ConvexHull.pdf)

* [Prefix Compression](problems/Recursion/PrefixCompression.pdf) - [Solution](src/Recursion/PrefixCompression.hs)

* [String Compression](problems/Recursion/StrCompression.pdf) - [Solution](src/Recursion/StrCompression.hs)

* [Super Digit](problems/Recursion/SuperDigit.pdf) - [Solution](src/Recursion/SuperDigit.hs)

## Running tests

```
./.github/run.sh
```

To run all matching tests:
```
./.github/run.sh -m <some_word>
```

To run exactly matching tests:
```
./.github/run.sh -m "/<some_word>/"
```

To run a _specific test_:
```
./.github/run.sh -m "/Ch11/evaluates expression/eval/"
```

To run a file containing a `main` method:
```
stack runhaskell app/Main.hs
```

To run an executable listed in `package.yaml`:
```
stack build
stack exec <name>
```

## License

Released under [Apache License v2.0](LICENSE).
