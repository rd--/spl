# Spl

- What is Spl?
- Why Spl?
- Notation?
- StdLib?
- Js-Sc3?

# Comments

_*_ and _/_ are both operators in Spl.
In St _//_ is quotient.
Comment syntax can use forms that are not otherwise allowed.
_(* ... *)_ as in Pascal and Ml &etc.
_;; ..._ as in Lisp.

# Strings

String are written _'...'_.
_"..."_ means _parseDoubleQuotedString('...')_.
_\`...\`_ means _parseBacktickQuotedString('...')_.

# Collections

Sequenceable:

- Array - fixed size, one-indexed (Array in St)
- List - variable sized, one-indexed (OrderedCollection in St, Array in Js)
- LinkedList - variable sized, one-indexed

Unordered:

- IdentitySet - (Set in Js)
- IdentityDictionary - (Map in Js)

# Subtleties

The array and dictionary initialisers must only evaluate the right hand side once.
A gensym-ed private name is used to store the initial value, and that name is used for the destructuring.

If _p.q_ is a procedure, it must be applied as _(p.q)(r)_.
_p.q(r)_ is _q(p, r)_, not _(q(p))(r)_.

The dispatch mechansim is by arity, so method calls are by definition arity-correct.
Local (anonymous) blocks however can be called at incorrect arity.
Arity checks are optionally added to non-method blocks.

System dictionary, system clock, system scheduler.
Workspace dictionary, implicitDictionary.

# Cli

- echo '{"command": "playText", "text": "SinOsc(440, 0) * 0.1"}' | netcat -C -q 0 -u 127.0.0.1 3010
- echo '{"command": "playText", "text": "Sin/home/rohan/sw/jssc3/help/graph/jmcc-analog-bubbles.stc"}' | netcat -C -q 0 -u 127.0.0.1 3010
- echo '{"command": "playFile", "fileName": "/home/rohan/sw/jssc3/help/graph/jmcc-analog-bubbles.stc"}' | netcat -C -q 0 -u 127.0.0.1 3010
- echo '{"command": "playFile", "fileName": "/home/rohan/sw/jssc3/help/graph/jmcc-analog-bubbles-mouse.stc"}' | netcat -C -q 0 -u 127.0.0.1 3010
- hsc3-scsynth reset

# Traits

_Collection_ and _SequenceableCollection_ are "traits".
_Array_ and _List_ are instances of both.
_IdentitySet_ and _IdentityDictionary_ are instances of _Collection_.
Traits must be loaded before Types.
When a type is added, methods for the traits that it implements are added to the dispatch table at the new type.
When a trait is extended methods are added both to the trait entry and to the dispatch table for all types that implement the trait.

# Class Methods

Since there are no classes, there are no class variables and no class methods.
The expression _Array.series(5, 1, 2)_ means _series(Array, 5, 1, 2)_.
_series_ uses _Array.new(5)_ to construct the collection.
_new(f, n)_ is defined as _f(n)_.
Similarly _Array.new_ makes an empty array because _new(f)_ is defined as _f()_.
_List.ofSize(3)_ makes a list having three nil slots, wheras _List.new(3)_ creates an empty list.
As in Smalltalk types can define a _species_ method to decide result types.

# Implications of Js

The standard library cannot assume:

- tail call optimisation
- shift/reset or call/cc

Co-routines cannot be implemented where control operators are implemented as higher-order procedures.
(Js has co-routines using _function*_ and _yield_ syntaxes.
Spl could implement a syntax _{! ... }_ to indicate a routine, however _yield_ cannot be called indirectly.
Idiomatic Spl requires yielding from within control structures, i.e. _{! 9.timesRepeat { 3.random.yield } }.fork_, which is not allowed.)

All Io is asynchronous, hence Promises.

# Implementation

All names, not only those that are reserved in Js, are prefixed with an underscore by the translator.

The built-in types are _unboxed_, that is they are encoded as their Js values.

User defined types, such as for Cartesian points, are encoded as records of the form _{type: 'Point', x: 0, y: 0}_.

# Smalltalk

- Control structures are implemented as procedures (no reserved words, no macro system)
- Notation to make writing arguments to control procedures concise, i.e. _(lamda () ...)_ is written _{...}_
- Trailing closure notation for control structure notation, i.e. _if(p) { q } { r }_
- Method return must be delimited, i.e. _withReturn { ... return(...) }_

# Notation

Notation for methods that return procedures, i.e. [1, 2, 3].species.value(5), ([1, 2, 3].species)(5).
Logical and is &, logical or is |, c.f. bitAnd and bitOr

# Conventions

Type constructors are capitalised.
The standard library writes _F(x)_ where _F_ is a constructor, _f(x)_ where _f_ is a control operator, and _x.f_ otherwise.

# St Compatibility

- _f.(x...)_ ⇒ _f.value(x...)_

_Rationale:_ In Smalltalk sending a message and evaluating a block are distinct operations. If _f(x)_ means send the message _f_ to _x_ it cannot also mean evaluate _f_ of _x_.   This syntax allows distinguishing these two cases where Sl is used as a notation for both systems.

# Mutation

Mutation return value rules are currently as in Smalltalk, i.e. p.x(1) == 1.
Variants for _update_ and _mutate_?  Pt(0,0).x(1) == Pt(1, 0)?  p.x!(1) == 1?

# Syntax

Arguments: _{ :p :q | ... }_
Temporaries: _| p q |_ or _| p = q, r = s |_.
Trailing closures: _if(p) { q } { r }_ &etc.
Keywords: _p.at(q, put: r)_ could mean _p.atPut(q, r)_.

# Exceptions

_return_ and _withReturn_ should operate using a distinct type.
At present _withReturn_ re-throws any value that is an instance of _Error_.
_ifError_ is after St.

# Types

Built-in types are the underlying type.
Some are renamed (_Set_ ⇒ _IdentitySet_, _Map_ ⇒ _IdentityDictionary_).
Ordinary types have a _type_ field that names the type.
Js types will be inferred as _value.constructor.name_.

# Prelude

Prelude is both _kernel_ and _stdlib_.

# Primitive

The <primitive> notation could include a language field, so that Js and Scheme implementations could be written in the same method.

# Array Syntax

_List[1, 2, 3]_ could mean _List([1, 2, 3])_.
In the general case this would be a _trailing array_ syntax, so _f(p) [q..] [r..]_ would mean _f(p, [q..], [r..])_.

# Unicode

- U+0021 ! EXCLAMATION MARK
- U+0024 $ DOLLAR SIGN
- U+0025 % PERCENT SIGN
- U+0026 & AMPERSAND
- U+002A * ASTERISK
- U+002B + PLUS SIGN
- U+002D - HYPHEN-MINUS
- U+002F / SOLIDUS
- U+003C < LESS-THAN SIGN
- U+003D = EQUALS SIGN
- U+003E > GREATER-THAN SIGN
- U+003F ? QUESTION MARK
- U+0040 @ COMMERCIAL AT
- U+005C \ REVERSE SOLIDUS
- U+005E ^ CIRCUMFLEX ACCENT
- U+007C | VERTICAL LINE
- U+007E ~ TILDE
- U+00B1 ± PLUS-MINUS SIGN
- U+00D7 × MULTIPLICATION SIGN
- U+00F7 ÷ DIVISION SIGN
- U+2044 ⁄ FRACTION SLASH
- U+2052 ⁒ COMMERCIAL MINUS SIGN
- U+2212 − MINUS SIGN
- U+2213 ∓ MINUS-OR-PLUS SIGN
- U+2215 ∕ DIVISION SLASH
- U+2248 ≈ ALMOST EQUAL TO
- U+2260 ≠ NOT EQUAL TO
- U+2261 ≡ IDENTICAL TO
- U+2264 ≤ LESS-THAN OR EQUAL TO
- U+2265 ≥ GREATER-THAN OR EQUAL TO
- U+226A ≪ MUCH LESS-THAN
- U+226B ≫ MUCH GREATER-THAN
- U+226E ≮ NOT LESS-THAN
- U+226F ≯ NOT GREATER-THAN
- U+22C5 ⋅ DOT OPERATOR
- U+2A74 ⩴ DOUBLE COLON EQUAL
- U+2A75 ⩵ TWO CONSECUTIVE EQUALS SIGNS
- U+2A76 ⩶ THREE CONSECUTIVE EQUALS SIGNS
- U+2A7D ⩽ LESS-THAN OR
- U+2A7E ⩾ GREATER-THAN OR SLANTED EQUAL TO
