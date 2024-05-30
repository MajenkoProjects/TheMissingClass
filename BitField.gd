extends RefCounted
class_name BitField

signal changed(val : int)

var value : int = 0 :
	set(x):
		value = x
		changed.emit(x)

func set_bit(b : int, v : bool = true) -> void:
	if v:
		value |= (1 << b)
	else:
		value &= ~(1 << b)

func clear_bit(b : int, v : bool = true) -> void:
	if v:
		value &= ~(1 << b)
	else:
		value |= (1 << b)

func toggle_bit(b : int) -> void:
	if is_set(b):
		clear_bit(b)
	else:
		set_bit(b)

func is_set(b) -> bool:
	return (value & (1 << b)) == (1 << b)

func set_value(v : int) -> void:
	value = v

func get_value() -> int:
	return value
