# MessageSend Syntax

Rewrite rule:

- _c:.k_ ⟹ _c.messageSend('k', 'parent', [])_
- _c:.k(p...)_ ⟹ _c.messageSend('k', 'parent', [p...])_

Syntax for the messageSend protocol.

This syntax makes using _delegation_ or _proto-type_ objects concise.

* * *

Categories: Syntax
