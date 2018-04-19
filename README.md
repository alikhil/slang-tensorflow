# Tensorflow language bindings for SLang

This repository contains tensorflow language bindings for SLang language.

## Development

Bindings are developed in a way that was proposed in [the documentation of Tensorflow](https://www.tensorflow.org/extend/language_bindings) by wrapping `C_API`.

Idea of library design is taken from [TensorFlowSharp](https://github.com/migueldeicaza/TensorFlowSharp/tree/89c5be631a2d1d8a632d9114ecea3f04d347f83c) - C# bindings for TF.


## Markers

When I have been working on this project the SLang compiler was not ready yet. Also I did have full view of SLang standard library. So, everytime when I asked myself `Oh, how to do XXX in SLang?` and come with no answer I left markers in my code. For instance:

* `TODO:`
* `ASSUME:`
* `WARN:`
* e.t.c.

## Example of usage

TODO: write example here