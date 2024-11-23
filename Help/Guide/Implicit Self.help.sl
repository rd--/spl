# Implicit Self

The parser does not implement an _implicit self_ mechanism,
method definitions must name each parameter.

Rationale:
Methods at `Void` have no parameters.
Constructor methods name the initial parameter distinctly,
i.e. the first argument to `SinOsc` is _freq_, not _self_.
