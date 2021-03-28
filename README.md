# brainlua
A (slow) brainfuck interpreter written in Lua.

## Usage
You must first `require` the file in your Lua code:

    local brainlua = require "brainlua"

Usage:

    brainlua("brainfuck code")
    brainlua("brainfuck code", "input")

## Common Tasks

You can execute a brainfuck file easily, like so:

    brainlua(io.open("code.b"):read("*a"))

brainlua also works with some interactive brainfuck programs, provided that the input is missing or empty.

## Disclaimer

This interpreter is very slow. If you want a faster brainfuck interpreter, use [qdb](http://brainfuck.org/qdb.c) or [awib](https://github.com/matslina/awib) instead.
