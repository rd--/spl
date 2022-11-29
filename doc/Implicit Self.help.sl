# Implicit Self

The parser does not implement an _implicit self_ mechanism, method definitions must name each parameter.

_Rationale_: Methods at _Void_ have no parameters.
Constructor methods name the initial parameter distinctly, i.e. the first argument to _SinOsc_ is _freq_, not _self_.
