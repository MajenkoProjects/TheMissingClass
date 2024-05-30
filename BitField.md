BitField
========

Store and manipulate binary flags.

Flags (bits) are represented as a simple integer from 0 through 62.

Usage:
-----

```javascript
var flags : BitField = BitField.new()
```

Methods:
--------

* `.set_bit(bit : int, [value : bool = true])`

Set a bit in the flags, or clear the bit if `value` is false.

* `.clear_bit(bit : int, [value : bool = true])`

Clear a bit in the flags, or set the bit if `value` is false. This is the exact opposite to `.set_bit` in every way.

* `.toggle_bit(bit : int)`

If a bit is set, clear it. If it's cleared, set it.

* `.is_set(bit : int) -> bool`

Test if a bit is set or not. Returns true if it is, otherwise false.

* `.get_value() -> int`

Returns the raw integer value representing the flags

* `.set_value(value : int)`

Sets the internal raw integer value representing the flags. Can be used to set all the flags to a specific state in one operation.

Signals:
--------

* `changed(value : int)`

Emitted whenever any bit, or the whole internal value, is changed. Passes the new value as the only parameter.
