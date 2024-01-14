My solutions to [HackerRank Functional Programming code challenges](https://www.hackerrank.com/domains/fp).

[![](https://github.com/asarkar/hackerrank-fp-haskell/workflows/CI/badge.svg)](https://github.com/asarkar/hackerrank-fp-haskell/actions)

## Index

### Introduction

| Problem                 | Difficulty | Solution |
|-------------------------|------------|----------|
| [Solve Me First FP](problems/Introduction/solve-me-first.pdf) | Easy | |
| [Hello World](problems/Introduction/hello-world.pdf) | Easy | |
| [Hello World N Times](problems/Introduction/hello-world-n-times.pdf) | Easy | [link](src/Introduction/HelloWorldN.hs) |
| [Filter Array](problems/Introduction/filter-array.pdf) | Easy | [link](src/Introduction/FilterArray.hs) |

### Recursion

| Problem                 | Difficulty | Solution |
|-------------------------|------------|----------|
| [Computing the GCD](problems/Recursion/gcd.pdf) | Easy | [link](src/Recursion/GCD.hs)
| [Fibonacci Numbers](problems/Recursion/fibonacci-numbers.pdf) | Easy | [link](src/Recursion/Fibonacci.hs) |
| [Pascal's Triangle](problems/Recursion/pascals-triangle.pdf) | Easy | [link](src/Recursion/PascalsTriangle.hs) |
| [String Mingling](problems/Recursion/string-mingling.pdf) | Easy | [link](src/Recursion/StrMingling.hs) |
| [String-o-Permute](problems/Recursion/string-o-permute.pdf) | Easy | [link](src/Recursion/StrPermutation.hs) |
| [String Compression](problems/Recursion/string-compression.pdf) | Easy | [link](src/Recursion/StrCompression.hs) |
| [Prefix Compression](problems/Recursion/prefix-compression.pdf) | Easy | [link](src/Recursion/PrefixCompression.hs) |
| [String Reductions](problems/Recursion/string-reductions.pdf) | Easy | [link](src/Recursion/StrReduction.hs) |
| [The Sum of Powers](problems/Recursion/sum-of-powers.pdf) | Easy | [link](src/Recursion/SumOfPowers.hs) |
| [Sequence full of colors](problems/Recursion/sequence-full-of-colors.pdf) | Easy | [link](src/Recursion/ColorSeq.hs) |
| [Filter Elements](problems/Recursion/filter-elements.pdf) | Easy | [link](src/Recursion/FilterElements.hs) |
| [Super Digit](problems/Recursion/super-digit.pdf) | Medium | [link](src/Recursion/SuperDigit.hs) |
| [Convex Hull](problems/Recursion/convex-hull.pdf) | Medium | [link](src/Recursion/ConvexHull.hs) |
| [Concave Polygon](problems/Recursion/concave-polygon.pdf) | Medium | |
| [Sierpinski triangles](problems/Recursion/sierpinski-triangles.pdf) | Advanced | [link](src/Recursion/SierpinskiTriangle.hs) |
| [Recursive Trees](problems/Recursion/fractal-trees.pdf) | Advanced | [link](src/Recursion/FractalTrees.hs) |

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
