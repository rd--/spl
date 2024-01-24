# UgenGraph

A type representing a named graph of unit generators.

This type can be encoded to the binary format understood by _scsynth_.

```
UgenGraph('sin', SinOsc(440, 0) * 0.1).send
```
