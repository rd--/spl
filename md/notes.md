# Packages

There is initial support for a "package" field at Type, Trait and Method.
The "package" field indicates the entity that "defines" the Type or Trait or Method.
(C.f. the "origin" field at Method, which indicates which Type or Trait the method is defined at.)
The idea is to have a _very_ simple notion of a _Package_.
A package is a named sequence of one or more .sl files.
For network loading it's important to be able to send requests for all required files immediately.
The primitive at present is _loadUrlSequence_.
This needs to be ammended to _loadPackageSequence_, which is essentially _loadNamedUrlSequenceSequence_.

# Categories

```
loadUrlSequence(['cat.sl'])
system.uncategorisedMethods
```

# Thoughts

- ProgramCollectionBrowser
- DocumentBrowser for structured texts, i.e. Adc Create Tutorial
- System -> SimpleLanguageInterpreter
- "Global" namespace
  + Are "workspace" variables a good idea?
  + Dictionary at Interpreter that can be "set"

# Self-like objects

- ⦃p: q…⦄ → PrototypeObject.newFrom(['p' -> q…])
- p‣q(r…) → p.performMessageSendWithSelfSemantics('q', [r…])

# Constants

There is a syntax for defining constants, ie. pi, e & epsilon (c.f. Kernel.sl).

Implement a dictionary for constants, either _constant_ or _system.constant_.
Instead of _Void>>unicodeFractions_ there would be _constant::unicodeFractions_
Add values such as _system.constant::epsilon = 2 ** -52_.
Defining constants in .sl library files requires adding a ConstantDefinition clause to the grammar.
To define array and dictionary constants requires adding arrayLiteral & dictionaryLiteral clauses.
In Ohm the ListOf rule is not allowed in literal contexts.

	LibraryExpression = TypeExpression | TraitExpression | ConstantDefinition
	ConstantDefinition = "constant" "::" identifier ":=" literal ";"
	literal = numberLiteral | singleQuotedStringLiteral | doubleQuotedStringLiteral | backtickQuotedStringLiteral | arrayLiteral | dictionaryLiteral
	arrayLiteral = "[" listOf<literal, ","> "]"
	dictionaryLiteral = "(" listOf<associationLiteral, ","> ")"
	associationLiteral = identifierAssociationLiteral | stringAssociationLiteral
	identifierAssociationLiteral = identifier ":" " "? literal
	stringAssociationLiteral = singleQuotedStringLiteral ":" " "? literal

	ConstantDefinition(_constant, _colonColon, name, _colonEquals, value, _semicolon) {
		return `_constant.set('${name.sourceString}', ${value.asJs});`
	},
	arrayLiteral(_l, array, _r) { return `[${commaList(array.asIteration().children)}]`; },
	dictionaryLiteral(_l, dict, _r) { return `new Map([${commaList(dict.asIteration().children)}])`; },
	identifierAssociationLiteral(lhs, _colon, _maybeSpace, rhs) { return `['${lhs.sourceString}', ${rhs.asJs}]`; },
	stringAssociationLiteral(lhs, _colon, _maybeSpace, rhs) { return `[${lhs.sourceString}, ${rhs.asJs}]`; },

# Traits For

Allow specifying existing types a Trait should apply to.
Replace definitions at multiple types (i.e. SinOsc at Array & Number & Ugen) with a Trait defined at the types (ie. @UgenInput : [Array, Number, Ugen])

# Application and Assignment

- _f()_ ⇒ apply _f_
- _f(x, ...)_ ⇒ apply _f_ to _x, ..._
- _x := y_ ⇒ assign _y_ to _x_

# Spl

- What is Spl?
- Why Spl?
- Notation?
- StdLib?
- Js-Sc3?

# Collections

Sequenceable:

- ByteArray, Float64Array - fixed size, one-indexed (Array in St)
- Array - variable sized, one-indexed (OrderedCollection in St, Array in Js)
- LinkedList - variable sized, one-indexed

Unordered:

- Set == IdentitySet (Set in Js)
- Map == IdentityDictionary - (Map in Js)
- Record == StringDictionary - (Object in Js)
- Bag

# Subtleties

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

# Implications of Js

The standard library cannot assume:

- tail call optimisation
- shift/reset or call/cc

Co-routines cannot be implemented where control operators are implemented as higher-order procedures.
(Js has co-routines using _function*_ and _yield_ syntaxes.
Spl could implement a syntax, say _{! ... }_, to indicate a routine, however _yield_ cannot be called indirectly.
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

# St Compatibility

- _f.(x...)_ ⇒ _f.value(x...)_

_Rationale:_ In Smalltalk sending a message and evaluating a block are distinct operations. If _f(x)_ means send the message _f_ to _x_ it cannot also mean evaluate _f_ of _x_.   This syntax allows distinguishing these two cases where Sl is used as a notation for both systems.

# Mutation

Mutation return value rules are currently as in Smalltalk, i.e. p.x(1) == 1.
Variants for _update_ and _mutate_?  Pt(0,0).x(1) == Pt(1, 0)?  p.x!(1) == 1?

# Syntax

Arguments: _{ :p :q | ... }_
Temporaries: _| p q |_ or _| p = q, r = s; |_.
Trailing closures: _if(p) { q } { r }_ &etc.
Keywords: _p.at(q, put: r)_ could mean _p.atPut(q, r)_.

# Exceptions

_return_ and _withReturn_ should operate using a distinct type.
At present _withReturn_ re-throws any value that is an instance of _Error_.
_ifError_ is after St.

# Types

Built-in types are the underlying type.
Some are renamed (_Object_ ⇒ _Record_)
Ordinary types have a _type_ field that names the type.
Js types will be inferred as _value.constructor.name_.

# Prelude

Prelude is both _kernel_ and _stdlib_.

# Primitive

The <primitive> notation could include a language field, so that Js and Scheme implementations could be written in the same method.

# Trailing Array Syntax

A _trailing array_ syntax would be like trailing closure syntax.
_f(p) [q..] [r..]_ would mean _f(p, [q..], [r..])_.
However this conflicts with [At Syntax], where _c[i]_ means _c.at(i)_.

# Array Syntax

_[1, 2, 3; 4, 5, 6]_ could mean _[[1, 2, 3], [4, 5, 6]]_.
_[1, 2; 3, 4;; 5, 6; 7, 8] could mean [[[1, 2], [3, 4]], [[5, 6], [7, 8]]].
And so on.
c[1; 2] could mean c[1][2]
c[1, 2; 3, 4] could mean c[1, 2][3, 4] meaning [c[1][3, 4], c[2][3, 4]]

# String Traits

If Strings are made Collections and SequenceableCollections then:

````
'string'.last = 'g'
'string'.includes('i')
'string'.indexOf('i') = 4
'string'.atWrap(13) = 's'
var a = Array(6); 'string'.collectInto({ :each | each.toUpperCase }, a); a.join = 'STRING'
'string'.atRandom.isString = true
````

However, Strings are not collections in the ordinary sense.

# Ohm

- Whitespace is implicitly skipped inside a rule application if the
	rule name begins with an uppercase letter.  (A syntactic rule is a
	rule whose name begins with an uppercase letter, and lexical rule
	is one whose name begins with a lowercase letter.)

# Input/Output

```
system.window.fetch('./text/smallhours-programs.text').then { :aResponse |
	aResponse.text.then { :aString |
		aString.postLine
	}
}

system.window.fetchString('./text/smallhours-programs.text').then { :aString |
	aString.lines.collect { :each | each.splitRegExp(RegExp(' - |/')) }.postLine
}

system.window.fetch('./png/os.512.png').then { :aResponse |
	aResponse.byteArray.then { :aByteArray |
		aByteArray.size.postLine
	}
}

system.window.fetchByteArray('./png/os.512.png').then { :aByteArray |
	aByteArray.size.postLine
}
```

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
- U+00AC ¬ NOT SIGN
- U+00B0 ° DEGREE SIGN
- U+00B1 ± PLUS-MINUS SIGN
- U+00B7 · MIDDLE DOT
- U+00D7 × MULTIPLICATION SIGN
- U+00F7 ÷ DIVISION SIGN
- U+02D9 ˙ DOT ABOVE
- U+03A0 Π GREEK CAPITAL LETTER PI
- U+03A3 Σ GREEK CAPITAL LETTER SIGMA
- U+03BB λ GREEK SMALL LETTER LAMDA
- U+03C0 π GREEK SMALL LETTER PI
- U+2022 • BULLET
- U+2026 … HORIZONTAL ELLIPSIS
- U+2043 ⁃ HYPHEN BULLET
- U+2044 ⁄ FRACTION SLASH
- U+2052 ⁒ COMMERCIAL MINUS SIGN
- U+2190 ← LEFTWARDS ARROW
- U+2191 ↑ UPWARDS ARROW
- U+2192 → RIGHTWARDS ARROW
- U+2193 ↓ DOWNWARDS ARROW
- U+21D2 ⇒ RIGHTWARDS DOUBLE ARROW
- U+2212 − MINUS SIGN
- U+2213 ∓ MINUS-OR-PLUS SIGN
- U+2215 ∕ DIVISION SLASH
- U+2219 ∙ BULLET OPERATOR
- U+2227 ∧ LOGICAL AND
- U+2228 ∨ LOGICAL AND
- U+2248 ≈ ALMOST EQUAL TO
- U+2254 ≔ COLON EQUALS
- U+2260 ≠ NOT EQUAL TO
- U+2261 ≡ IDENTICAL TO
- U+2262 ≢ NOT IDENTICAL TO
- U+2264 ≤ LESS-THAN OR EQUAL TO
- U+2265 ≥ GREATER-THAN OR EQUAL TO
- U+226A ≪ MUCH LESS-THAN
- U+226B ≫ MUCH GREATER-THAN
- U+226E ≮ NOT LESS-THAN
- U+226F ≯ NOT GREATER-THAN
- U+22A4 ⊤ DOWN TACK
- U+22C5 ⋅ DOT OPERATOR
- U+22EE ⋮ VERTICAL ELLIPSIS
- U+25CB ○ WHITE CIRCLE
- U+25CF ● BLACK CIRCLE
- U+261B ☛ BLACK RIGHT POINTING INDEX
- U+261E ☞ WHITE RIGHT POINTING INDEX
- U+27F5 ⟵ LONG LEFTWARDS ARROW
- U+27F6 ⟶ LONG RIGHTWARDS ARROW
- U+27F9 ⟹ LONG RIGHTWARDS DOUBLE ARROW
- U+29BF ⦿ CIRCLED BULLET
- U+29FA ⧺ DOUBLE PLUS
- U+2A74 ⩴ DOUBLE COLON EQUAL
- U+2A75 ⩵ TWO CONSECUTIVE EQUALS SIGNS
- U+2A76 ⩶ THREE CONSECUTIVE EQUALS SIGNS
- U+2A7D ⩽ LESS-THAN OR SLANTED EQUAL TO
- U+2A7E ⩾ GREATER-THAN OR SLANTED EQUAL TO
- U+22EF ⋯ MIDLINE HORIZONTAL ELLIPSIS
- U+2209 ∉ Not An Element Of
- U+220C ∌ DOES NOT CONTAIN AS MEMBER
- U+00B1 ± PLUS-MINUS SIGN
- U+2213 ∓ MINUS-OR-PLUS SIGN
- U+002B + PLUS SIGN
- U+2212 − MINUS SIGN
- U+207A ⁺ Superscript Plus Sign
- U+208A ₊ Subscript Plus Sign
- U+207B ⁻ Superscript Minus
- U+208B ₋ Subscript Minus
- U+207C ⁼ Superscript Equals Sign
- U+208C ₌ Subscript Equals Sign
- U+207D ⁽ Superscript Left Parenthesis
- U+208D ₍ Subscript Left Parenthesis
- U+207E ⁾ Superscript Right Parenthesis
- U+208E ₎ Subscript Right Parenthesis
