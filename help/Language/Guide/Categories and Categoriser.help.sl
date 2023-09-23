# Categories and Categoriser

The categorisation system forms a graph, not a tree.
A category is a named set of names.
The system category dictionary is a set of categories.
A category may include another category, though it should not include itself.

Since a name might be used both for a category and a type or a trait or a method,
category names by convention end with a _/_.
By convention sub-categories are named as paths.

The categoriser can receive information from a variety of sources.
For instance the Smalltalk categories for both methods and classes can be loaded,
alongside the SuperCollider categories for unit generators.
