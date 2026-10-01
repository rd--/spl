# Experimental Implicit Dictionary

Rewrite rules:

- _::k_ ⇒ _at(implicitDictionary, 'k')_
- _::k := v_ ⇒ _atPut!(implicitDictionary, 'k', v)_

Not implemented.
There are no global variables except method names.
