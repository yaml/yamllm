yamllm
======

A YAMLScript tool to query LLMs


## Synopsis

```
$ yamllm 'Why pink?'
Q: Why pink?
llama3-8b-8192:
The question of pink!

The color pink has a long and complex history, and its associations and
meanings have evolved over time. Here are some possible reasons why pink might
be associated with certain qualities or themes:
...
$
```


## Overview

This is a project to play with various LLMs from the command line.

At the moment it works with [Groq](https://console.groq.com/) which you can use
for free with generous limits.
It's also pretty fast.

It also works with [OpenAI's API](https://platform.openai.com/docs/overview),
which you have to pay for but costs pennies for single user interactive usage.

The tool is written in YAMLScript and requires a recent `ys`.

You can install it here (in `$PWD/bin/`) with `make install-ys`.


## Installation

* Get a Groq API key [here](https://console.groq.com/keys).

Run these commands:
```
$ make install-ys     # Install YAMLScript `bin/ys`
$ export YAMLLM_GROQ_API_KEY=<your-groq-api-key>
$ # or: export YAMLLM_OPENAI_API_KEY=<your-openai-api-key>
$ source .rc          # Adds `$PWD/bin` to your PATH (for bash or zsh)
$ yamllm --help       # Ask it for some help
$ yamllm 'Why pink?'  # Get to the important stuff
```

These programs make it nicer to use but are not required:

* Install `rlwrap` for readline support and query history.
* Install `prettier` for 80 column output reformatting.
  ```
  npm install -g prettier
  ```


### Try in a Browser with Github Codespaces

Use the [Codespace Quickstart Link](
https://codespaces.new/yaml/yamllm?quickstart=1) to try out yamllm in a browser
environment.


## CLI Usage

To start a query loop:
```
$ yamllm
```

Use `ctl-d`, `exit` or `q` to exit.

To run a single query:
```
$ yamllm 'Tell me a story'
```


## Environment Variables

To use these variables, be sure to `export` them after setting them.
One of the first 2 here is required.

* `YAMLLM_GROQ_API_KEY=<groq-api-key>`

  Required to access the Groq API (free).
  Get one [here](https://console.groq.com/keys).

* `YAMLLM_OPENAI_API_KEY=<open-api-key>`

  Required to access the OpenAI API (not free, but not expensive).
  Get one [here](https://platform.openai.com/api-keys).

* `YAMLLM_MODEL=<model-id>`

  Choose one of groq's models:

  ```
  * llama3    (llama3-70b-8192     Meta)
  * llame3-8  (llama3-8b-8192      Meta)
  * gemma     (gemma-7b-it         Google)
  * gemma2    (gemma2-9b-it        Google)
  * mixtral   (mixtral-8x7b-32768  Mistral)
  * whisper   (whisper-large-v3    OpenAI)
  * gpt4++    (gpt-4o              OpenAI)
  * gpt4+     (gpt-4-turbo         OpenAI)
  * gpt4      (gpt-4               OpenAI)
  * gpt3      (gpt-3.5-turbo       OpenAI)
  ```

  Default is `llama3-70b-8192` if `YAMLLM_GROQ_API_KEY` is set, `gpt-4o` if
  `YAMLLM_OPENAI_API_KEY` is set else error.


* `YAMLLM_PRE=<file>`

  File containing text to prepend to every prompt sent to API.

* `YAMLLM_POST=<file>`

  File containing text to append to every prompt sent to API.

* `YAMLLM_PROMPT=<file>`

  File containing the prompt text to send to API.
  `YAMLLM_PRE` and `YAMLLM_POST` are added if specified.

* `YAMLLM_TEMP=<number 0.0 - 2.0>`

  Higher is more random.
  Lower is more deterministic.
  Default is 0.8.

* `YAMLLM_TOPP=<number 0.0 - 1.0>`

  Alternative way to do something like `YAMLLM_TEMP`.
  Default is 1.0.

* `YAMLLM_TEST_FILE=$PWD/test/test1/yaml`

  Set this to run the YAML interaction test suite.

* `YAMLLM_DEBUG=1`

  Dump API payloads.
