yamllm
======

A YAMLScript tool to query LLMs


## Synopsis

```
$ source .rc
$ yamllm 'Why pink?'
Q: Why pink?
llama3-8b-8192:
The question of pink!

The color pink has a long and complex history, and its associations and meanings
have evolved over time. Here are some possible reasons why pink might be
associated with certain qualities or themes:
...
$
```


## Overview

This is a project to play with various LLMs from the command line.

At the moment only works with [Groq](https://console.groq.com/).

The tool is written in YAMLScript and requires a recent `ys`.

You can install it here with `make install-ys`.


## Installation

* Get a Groq API key [here](https://console.groq.com/keys).

Run these commands:
```
$ make install-ys  # Install YAMLScript `bin/ys`
$ export YAMLLM_GROQ_API_KEY=<your-groq-api-key>
$ source .rc       # Add `bin` to PATH (for bash or zsh)
$ yamllm --help
```

Nice but not required:

* Install `rlwrap` for readline support and query history.
* Install `prettier` for 80 column output reformatting.
  ```
  npm install -g prettier
  ```


## CLI Usage

To start a query loop:
```
$ yamllm
```

Use `ctl-d`, `exit` or `q` to exit.

To run a sinlge query:
```
$ yamllm 'Tell me a story'


## Environment Variables

To use these variables, be sure to `export` them after setting them.

* `YAMLLM_GROQ_API_KEY=<groq-api-key>`

  Required to access groq.
  Get one [here](https://console.groq.com/keys).

* `YAMLLM_API_MODEL=<model-id>`

  Choose one of groq's models:

  * `llama3-70b-8192` (from Meta) - default
  * `llama3-8b-8192` (from Meta)
  * `mixtral-8x7b-32768` (from Mistral)
  * `gemma-7b-it` (from Google)

* `YAMLLM_PREAMBLE_FILE=<file>`

  File containing text to prepend to every message sent to API.

* `YAMLLM_POSTAMBLE_FILE=<file>`

  File containing text to append to every message sent to API.

* `YAMLLM_TEMP=<number 0.0 - 2.0>`

  Higher is more random.
  Lower is more deterministic.
  Default is 0.8.

* `YAMLLM_TOPP=<number 0.0 - 1.0>`

  Alternative way to do something linke YAMLLM_TEMP.
  Default is 1.0.

* `YAMLLM_TEST_FILE=$PWD/test/test1/yaml`

  Set this to run the YAML interaction test suite.

* `YAMLLM_DEBUG=1`

  Dump API payloads.

