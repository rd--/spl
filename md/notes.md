# Keyed

Keyed as Trait, implemented by Map and Record.

# Help

Help provides category names, after final '-- ' on initial line.
HelpIndex as Spl package.
Document adverbs.

# Constructor

Allow _type_ declarations at slots, and if one is provided for the first slot make constructor.

# Packages

There is initial support for a "package" field at Type, Trait and Method.
The "package" field indicates the entity that "defines" the Type or Trait or Method.
(C.f. the "origin" field at Method, which indicates which Type or Trait the method is defined at.)
The idea is to have a _very_ simple notion of a _Package_.
A package is a named sequence of one or more .sl files.
For network loading it's important to be able to send requests for all required files immediately.
The primitive is _loadPackagesSequence_.
After the core is loaded there is a language level Package type.
In the simplest case of a package consisting of a single file it can be written Package(fileName).
Package names should be simple, ie. Set not Collection-Set.
Packages should be categorized, ie. the category of Set is Collection.
Packages named for types are already categorized under 'type'.
Local packages are given by 'Category' and 'Name' and the implementation file is derived as 'Category/Name.sl'.
Remove packages are given by 'Url', the first comment provides 'Name' and 'Category'.
In both cases dependencies are given by 'Requires' in first comment.
In a package index, remote packages are named by Url, local packages by a 'Package' (Category-Name) string.

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

- U+0021 ! Exclamation Mark
- U+0024 $ Dollar Sign
- U+0025 % Percent Sign
- U+0026 & Ampersand
- U+002a * Asterisk
- U+002b + Plus Sign
- U+002d - Hyphen-Minus
- U+002f / Solidus
- U+003c < Less-Than Sign
- U+003d = Equals Sign
- U+003e > Greater-Than Sign
- U+003f ? Question Mark
- U+0040 @ Commercial At
- U+005c \ Reverse Solidus
- U+005e ^ Circumflex Accent
- U+007c | Vertical Line
- U+007c | Vertical Line
- U+007e ~ Tilde
- U+00a6 ¦ Broken Bar
- U+00a7 § Section Sign
- U+00ac ¬ Not Sign
- U+00b0 ° Degree Sign
- U+00b1 ± Plus-Minus Sign
- U+00b6 ¶ Pilcrow Sign
- U+00b7 · Middle Dot
- U+00d7 × Multiplication Sign
- U+00f7 ÷ Division Sign
- U+022a4 ⊤ Down Tack
- U+022a5 ⊥ Up Tack
- U+022a7 ⊧ Models
- U+022a8 ⊨ True
- U+022a9 ⊩ Forces
- U+022aa ⊪ Triple Vertical Bar Right Turnstile
- U+022ab ⊫ Double Vertical Bar Double Right Turnstile
- U+022ac ⊬ Does Not Prove
- U+022ad ⊭ Not True
- U+022ae ⊮ Does Not Force
- U+022af ⊯ Negated Double Vertical Bar Double Right Turnstile
- U+022b0 ⊰ Precedes Under Relation
- U+022b1 ⊱ Succeeds Under Relation
- U+022b2 ⊲ Normal Subgroup Of
- U+022b3 ⊳ Contains As Normal Subgroup
- U+022b4 ⊴ Normal Subgroup Of Or Equal To
- U+022b5 ⊵ Contains As Normal Subgroup Or Equal To
- U+022b6 ⊶ Original Of
- U+022b7 ⊷ Image Of
- U+022b8 ⊸ Multimap
- U+022b9 ⊹ Hermitian Conjugate Matrix
- U+022ba ⊺ Intercalate
- U+022bb ⊻ \Veebar, \Xor Xor
- U+022bc ⊼ \Barwedge, \Nand Nand
- U+022bd ⊽ \Barvee, \Nor Nor
- U+022be ⊾ Right Angle With Arc
- U+022bf ⊿ Right Triangle
- U+022c0 ⋀ N-Ary Logical And
- U+022c1 ⋁ N-Ary Logical Or
- U+022c2 ⋂ N-Ary Intersection
- U+022c3 ⋃ N-Ary Union
- U+022c4 ⋄ Diamond Operator
- U+022c5 ⋅ Dot Operator
- U+022c6 ⋆ Star Operator
- U+022c7 ⋇ Division Times
- U+022c8 ⋈ Bowtie
- U+022c9 ⋉ Left Normal Factor Semidirect Product
- U+022ca ⋊ Right Normal Factor Semidirect Product
- U+022cb ⋋ Left Semidirect Product
- U+022cc ⋌ Right Semidirect Product
- U+022cd ⋍ Reversed Tilde Equals
- U+022ce ⋎ Curly Logical Or
- U+022cf ⋏ Curly Logical And
- U+022d0 ⋐ Double Subset
- U+022d1 ⋑ Double Superset
- U+022d2 ⋒ Double Intersection
- U+022d3 ⋓ Double Union
- U+022d4 ⋔ Pitchfork
- U+022d5 ⋕ Equal And Parallel To
- U+022d6 ⋖ Less-Than With Dot / Less Than With Dot
- U+022d7 ⋗ Greater-Than With Dot / Greater Than With Dot
- U+022d8 ⋘ Very Much Less-Than / Very Much Less Than
- U+022d9 ⋙ Very Much Greater-Than / Very Much Greater Than
- U+022da ⋚ Less-Than Equal To Or Greater-Than / Less Than Equal To Or Greater Than
- U+022db ⋛ Greater-Than Equal To Or Less-Than / Greater Than Equal To Or Less Than
- U+022dc ⋜ Equal To Or Less-Than / Equal To Or Less Than
- U+022dd ⋝ Equal To Or Greater-Than / Equal To Or Greater Than
- U+022de ⋞ Equal To Or Precedes
- U+022df ⋟ Equal To Or Succeeds
- U+022e0 ⋠ Does Not Precede Or Equal
- U+022e1 ⋡ Does Not Succeed Or Equal
- U+022e2 ⋢ Not Square Image Of Or Equal To
- U+022e3 ⋣ Not Square Original Of Or Equal To
- U+022e4 ⋤ Square Image Of Or Not Equal To
- U+022e5 ⋥ Square Original Of Or Not Equal To
- U+022e6 ⋦ Less-Than But Not Equivalent To / Less Than But Not Equivalent To
- U+022e7 ⋧ Greater-Than But Not Equivalent To / Greater Than But Not Equivalent To
- U+022e8 ⋨ Precedes But Not Equivalent To
- U+022e9 ⋩ Succeeds But Not Equivalent To
- U+022ea ⋪ Not Normal Subgroup Of
- U+022eb ⋫ Does Not Contain As Normal Subgroup
- U+022ec ⋬ Not Normal Subgroup Of Or Equal To
- U+022ed ⋭ Does Not Contain As Normal Subgroup Or Equal
- U+022ee ⋮ Vertical Ellipsis
- U+022ef ⋯ Midline Horizontal Ellipsis
- U+022f0 ⋰ Up Right Diagonal Ellipsis
- U+022f1 ⋱ Down Right Diagonal Ellipsis
- U+022f2 ⋲ Element Of With Long Horizontal Stroke
- U+022f3 ⋳ Element Of With Vertical Bar At End Of Horizontal Stroke
- U+022f4 ⋴ Small Element Of With Vertical Bar At End Of Horizontal Stroke
- U+022f5 ⋵ Element Of With Dot Above
- U+022f6 ⋶ Element Of With Overbar
- U+022f7 ⋷ Small Element Of With Overbar
- U+022f8 ⋸ Element Of With Underbar
- U+022f9 ⋹ Element Of With Two Horizontal Strokes
- U+022fa ⋺ Contains With Long Horizontal Stroke
- U+022fb ⋻ Contains With Vertical Bar At End Of Horizontal Stroke
- U+022fc ⋼ Small Contains With Vertical Bar At End Of Horizontal Stroke
- U+022fd ⋽ Contains With Overbar
- U+022fe ⋾ Small Contains With Overbar
- U+022ff ⋿ Z Notation Bag Membership
- U+02300 ⌀ Diameter Sign
- U+02302 ⌂ House
- U+02305 ⌅ Projective
- U+02306 ⌆ Perspective
- U+02308 ⌈ Left Ceiling
- U+02309 ⌉ Right Ceiling
- U+0230a ⌊ Left Floor
- U+0230b ⌋ Right Floor
- U+02310 ⌐ Reversed Not Sign
- U+02311 ⌑ Square Lozenge
- U+02312 ⌒ Arc
- U+02313 ⌓ Segment
- U+02315 ⌕ Telephone Recorder
- U+02317 ⌗ Viewdata Square
- U+02319 ⌙ Turned Not Sign
- U+0231c ⌜ Top Left Corner
- U+0231d ⌝ Top Right Corner
- U+0231e ⌞ Bottom Left Corner
- U+0231f ⌟ Bottom Right Corner
- U+02322 ⌢ Frown
- U+02323 ⌣ Smile
- U+0232c ⌬ Benzene Ring
- U+02332 ⌲ Conical Taper
- U+02336 ⌶ Apl Functional Symbol I-Beam
- U+0233d ⌽ Apl Functional Symbol Circle Stile
- U+0233f ⌿ Apl Functional Symbol Slash Bar
- U+02340 ⍀ Apl Functional Symbol Backslash Bar
- U+02353 ⍓ Apl Functional Symbol Quad Up Caret
- U+02370 ⍰ Apl Functional Symbol Quad Question
- U+02394 ⎔ Software-Function Symbol
- U+023a3 ⎣ Left Square Bracket Lower Corner
- U+023b0 ⎰ Upper Left Or Lower Right Curly Bracket Section
- U+023b1 ⎱ Upper Right Or Lower Left Curly Bracket Section
- U+023b4 ⎴ Top Square Bracket
- U+023b5 ⎵ Bottom Square Bracket
- U+023b6 ⎶ Bottom Square Bracket Over Top Square Bracket
- U+023b7 ⎷ Radical Symbol Bottom
- U+023b8 ⎸ Left Vertical Box Line
- U+023b9 ⎹ Right Vertical Box Line
- U+023ce ⏎ Return Symbol
- U+023de ⏞ Top Curly Bracket
- U+023df ⏟ Bottom Curly Bracket
- U+023e2 ⏢ White Trapezium
- U+023e3 ⏣ Benzene Ring With Circle
- U+023e4 ⏤ Straightness
- U+023e5 ⏥ Flatness
- U+023e6 ⏦ Ac Current
- U+023e7 ⏧ Electrical Intersection
- U+028c Ʌ Latin Small Letter Turned V
- U+02c6 ˆ Modifier Letter Circumflex Accent
- U+02d9 ˙ Dot Above
- U+039b Λ Greek Capital Letter Lamda
- U+03a0 Π Greek Capital Letter Pi
- U+03a3 Σ Greek Capital Letter Sigma
- U+03bb Λ Greek Small Letter Lamda
- U+03c0 Π Greek Small Letter Pi
- U+1019a 𐆚 Roman As Sign
- U+2014 — Em Dash
- U+2016 ‖ Double Vertical Line
- U+2020 † Dagger
- U+2021 ‡ Double Dagger
- U+2022 • Bullet
- U+2024 ․ One Dot Leader
- U+2025 ‥ Two Dot Leader
- U+2026 … Horizontal Ellipsis
- U+2038 ‸ Caret
- U+2043 ⁃ Hyphen Bullet
- U+2044 ⁄ Fraction Slash
- U+204b ⁋ Reversed Pilcrow Sign
- U+2052 ⁒ Commercial Minus Sign
- U+207a ⁺ Superscript Plus Sign
- U+207b ⁻ Superscript Minus
- U+207c ⁼ Superscript Equals Sign
- U+207d ⁽ Superscript Left Parenthesis
- U+207e ⁾ Superscript Right Parenthesis
- U+208a ₊ Subscript Plus Sign
- U+208b ₋ Subscript Minus
- U+208c ₌ Subscript Equals Sign
- U+208d ₍ Subscript Left Parenthesis
- U+208e ₎ Subscript Right Parenthesis
- U+2190 ← Leftwards Arrow
- U+2191 ↑ Upwards Arrow
- U+2192 → Rightwards Arrow
- U+2193 ↓ Downwards Arrow
- U+21d2 ⇒ Rightwards Double Arrow
- U+21e0 ⇠ Leftwards Dashed Arrow
- U+21e2 ⇢ Rightwards Dashed Arrow
- U+2208 ∈ Element Of
- U+2209 ∉ Not An Element Of
- U+220b ∋ Contains As Member
- U+220c ∌ Does Not Contain As Member
- U+2212 − Minus Sign
- U+2213 ∓ Minus-Or-Plus Sign
- U+2215 ∕ Division Slash
- U+2219 ∙ Bullet Operator
- U+2223 ∣ Divides
- U+2227 ∧ Logical And
- U+2227 ∧ Logical And
- U+2228 ∨ Logical And
- U+2248 ≈ Almost Equal To
- U+2254 ≔ Colon Equals
- U+2260 ≠ Not Equal To
- U+2261 ≡ Identical To
- U+2262 ≢ Not Identical To
- U+2264 ≤ Less-Than Or Equal To
- U+2265 ≥ Greater-Than Or Equal To
- U+226a ≪ Much Less-Than
- U+226b ≫ Much Greater-Than
- U+226e ≮ Not Less-Than
- U+226f ≯ Not Greater-Than
- U+229a ⊚ Circled Ring Operator
- U+229b ⊛ Circled Asterisk Operator
- U+229c ⊜ Circled Equals
- U+22a1 ⊡ Squared Dot Operator
- U+22a4 ⊤ Down Tack
- U+22a5 ⊥ Up Tack
- U+22ba ⊺ Intercalate
- U+22c5 ⋅ Dot Operator
- U+22ee ⋮ Vertical Ellipsis
- U+22ef ⋯ Midline Horizontal Ellipsis
- U+2336 ⌶ Apl Functional Symbol I-Beam
- U+2337 ⌷ Apl Functional Symbol Squish Quad
- U+2338 ⌸ Apl Functional Symbol Quad Equal
- U+2339 ⌹ Apl Functional Symbol Quad Divide
- U+233a ⌺ Apl Functional Symbol Quad Diamond
- U+233b ⌻ Apl Functional Symbol Quad Jot
- U+233c ⌼ Apl Functional Symbol Quad Circle
- U+233d ⌽ Apl Functional Symbol Circle Stile
- U+233e ⌾ Apl Functional Symbol Circle Jot
- U+233f ⌿ Apl Functional Symbol Slash Bar
- U+2340 ⍀ Apl Functional Symbol Backslash Bar
- U+2341 ⍁ Apl Functional Symbol Quad Slash
- U+2342 ⍂ Apl Functional Symbol Quad Backslash
- U+2343 ⍃ Apl Functional Symbol Quad Less-Than
- U+2344 ⍄ Apl Functional Symbol Quad Greaterthan
- U+2345 ⍅ Apl Functional Symbol Leftwards Vane
- U+2346 ⍆ Apl Functional Symbol Rightwards Vane
- U+2347 ⍇ Apl Functional Symbol Quad Leftwards Arrow
- U+2348 ⍈ Apl Functional Symbol Quad Rightwards Arrow
- U+2349 ⍉ Apl Functional Symbol Circle Backslash
- U+234a ⍊ Apl Functional Symbol Down Tack Underbar
- U+234b ⍋ Apl Functional Symbol Delta Stile
- U+234c ⍌ Apl Functional Symbol Quad Down Caret
- U+234d ⍍ Apl Functional Symbol Quad Delta
- U+234e ⍎ Apl Functional Symbol Down Tack Jot
- U+234f ⍏ Apl Functional Symbol Upwards Vane
- U+2350 ⍐ Apl Functional Symbol Quad Upwards Arrow
- U+2351 ⍑ Apl Functional Symbol Up Tack Overbar
- U+2352 ⍒ Apl Functional Symbol Del Stile
- U+2353 ⍓ Apl Functional Symbol Quad Up Caret
- U+2354 ⍔ Apl Functional Symbol Quad Del
- U+2355 ⍕ Apl Functional Symbol Up Tack Jot
- U+2356 ⍖ Apl Functional Symbol Downwards Vane
- U+2357 ⍗ Apl Functional Symbol Quad Downwards Arrow
- U+2358 ⍘ Apl Functional Symbol Quote Underbar
- U+2359 ⍙ Apl Functional Symbol Delta Underbar
- U+235a ⍚ Apl Functional Symbol Diamond Underbar
- U+235b ⍛ Apl Functional Symbol Jot Underbar
- U+235c ⍜ Apl Functional Symbol Circle Underbar
- U+235d ⍝ Apl Functional Symbol Up Shoe Jot
- U+235e ⍞ Apl Functional Symbol Quote Quad
- U+235f ⍟ Apl Functional Symbol Circle Star
- U+2360 ⍠ Apl Functional Symbol Quad Colon
- U+2361 ⍡ Apl Functional Symbol Up Tack Diaeresis
- U+2362 ⍢ Apl Functional Symbol Del Diaeresis
- U+2363 ⍣ Apl Functional Symbol Star Diaeresis
- U+2364 ⍤ Apl Functional Symbol Jot Diaeresis
- U+2365 ⍥ Apl Functional Symbol Circle Diaeresis
- U+2366 ⍦ Apl Functional Symbol Down Shoe Stile
- U+2367 ⍧ Apl Functional Symbol Left Shoe Stile
- U+2368 ⍨ Apl Functional Symbol Tilde Diaeresis
- U+2369 ⍩ Apl Functional Symbol Greater-Than Diaeresis
- U+236a ⍪ Apl Functional Symbol Comma Bar
- U+236b ⍫ Apl Functional Symbol Del Tilde
- U+236c ⍬ Apl Functional Symbol Zilde
- U+236d ⍭ Apl Functional Symbol Stile Tilde
- U+236e ⍮ Apl Functional Symbol Semicolon Underbar
- U+236f ⍯ Apl Functional Symbol Quad Not Equal
- U+2370 ⍰ Apl Functional Symbol Quad Question
- U+2371 ⍱ Apl Functional Symbol Down Caret Tilde
- U+2372 ⍲ Apl Functional Symbol Up Caret Tilde
- U+2373 ⍳ Apl Functional Symbol Iota
- U+2374 ⍴ Apl Functional Symbol Rho
- U+2375 ⍵ Apl Functional Symbol Omega
- U+2376 ⍶ Apl Functional Symbol Alpha Underbar
- U+2377 ⍷ Apl Functional Symbol Epsilon Underbar
- U+2378 ⍸ Apl Functional Symbol Iota Underbar
- U+2379 ⍹ Apl Functional Symbol Omega Underbar
- U+237a ⍺ Apl Functional Symbol Alpha
- U+2395 ⎕ Apl Functional Symbol Quad
- U+25af ▯ White Vertical Rectangle
- U+25cb ○ White Circle
- U+25cf ● Black Circle
- U+261b ☛ Black Right Pointing Index
- U+261e ☞ White Right Pointing Index
- U+2628 ☨ Cross Of Lorraine
- U+26cb ⛋ White Diamond In Square
- U+271d ✝ Latin Cross
- U+2761 ❡ Curved Stem Paragraph Sign Ornament
- U+27f5 ⟵ Long Leftwards Arrow
- U+27f6 ⟶ Long Rightwards Arrow
- U+27f9 ⟹ Long Rightwards Double Arrow
- U+2919 ⤙ Leftwards Arrow-Tail
- U+291b ⤛ Leftwards Double Arrow-Tail
- U+291d ⤝ Leftwards Arrow To Black Diamond
- U+29b0 ⦰ Reversed Empty Set
- U+29be ⦾ Circled White Bullet
- U+29bf ⦿ Circled Bullet
- U+29c4 ⧄ Squared Rising Diagonal Slash
- U+29c5 ⧅ Squared Falling Diagonal Slash
- U+29c7 ⧇ Squared Small Circle
- U+29f7 ⧷ Reverse Solidus With Horizontal Stroke
- U+29fa ⧺ Double Plus
- U+2a40 ⩀ Intersection With Dot
- U+2a74 ⩴ Double Colon Equal
- U+2a75 ⩵ Two Consecutive Equals Signs
- U+2a76 ⩶ Three Consecutive Equals Signs
- U+2a7d ⩽ Less-Than Or Slanted Equal To
- U+2a7e ⩾ Greater-Than Or Slanted Equal To
- U+2aff ⫿ N-Ary White Vertical Bar
- U+2bb9 ⮹ Up Arrowhead In A Rectangle Box
- U+2bd1 ⯑ Uncertainty Sign
- U+2e38 ⸸ Turned Dagger
- U+2e3a ⸺ Two-Em Dash
- U+2e3b ⸻ Three-Em Dash
- U+2e3f ⸿ Capitulum
- U+2e4b ⹋ Triple Dagger
- U+2e4d ⹍ Paragraphus Mark
- U+3012 〒 Postal Mark

- # Unicode

- <https://www.unicode.org/charts/PDF/U2300.pdf>
