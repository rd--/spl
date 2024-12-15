# Navigator

A `Type` representing the state and the identity of the user agent.
It is accessed using `navigator` at `system`,
or equivalently at _system.window_:

```
>>> system.navigator.isNavigator
true
```

The `userAgent` method answers a `String` telling the name of the user agent,
i.e. 'Deno/2.1.4' or 'Mozilla/5.0' &etc.

```
>>> system.navigator.userAgent.isString
true
```

Other methods,
some of which are context dependent,
are:

- `deviceMemory`: in gigabytes (approx.)
- `gpu`: graphics processor
- `hardwareConcurrency`: processor count
- `language`: preferred language
- `maxTouchPoints`: touch input
- `requestMidiAccess`: midi devices
- `sendBeacon`: send http
- `storage`: storage manager
- `usb`: usb devices
- `userAgent`: name of navigator

* * *

See also: System, Window
