# brainlua
A (slow) brainfuck interpreter written in Lua.

## Usage
You must first `require` the file in your Lua code:

    local brainlua = require "brainlua"

Usage:

    brainlua("brainfuck code")
    brainlua("brainfuck code", "input")
