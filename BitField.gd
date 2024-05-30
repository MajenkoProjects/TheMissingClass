# Copyright 2024 Majenko Technologies
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are met:
#
# 1. Redistributions of source code must retain the above copyright notice,
#    this list of conditions and the following disclaimer.
#
# 2. Redistributions in binary form must reproduce the above copyright notice,
#    this list of conditions and the following disclaimer in the documentation
#    and/or other materials provided with the distribution.
#
# 3. Neither the name of the copyright holder nor the names of its contributors
#    may be used to endorse or promote products derived from this software
#    without specific prior written permission.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
# AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
# IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
# ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
# LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
# CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
# SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
# INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
# CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
# ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF
# THE POSSIBILITY OF SUCH DAMAGE.

extends RefCounted
class_name BitField

## A binary bitwise flags class
##
## This class gives a simple interface to bitwise flags. Simple set and clear
## operations as well as a bit testing function make this simple to use.
##
## A bit is indicated by its offset within the integer - that is bits are
## numbered from 0 to 63 inclusive.


## Emitted whenever a bit, or the whole value, changes.
signal changed(val : int)

## The raw internal integer representation of the bits.
var value : int = 0 :
	set(x):
		value = x
		changed.emit(x)


## Set a bit. If the optional second parameter is set to false the bit will
## be cleared instead.
func set_bit(b : int, v : bool = true) -> void:
	if v:
		value |= (1 << b)
	else:
		value &= ~(1 << b)

## Clear a bit. If the optional setcond parameter is set to false the bit
## will be set instead.
func clear_bit(b : int, v : bool = true) -> void:
	if v:
		value &= ~(1 << b)
	else:
		value |= (1 << b)

## Toggle a bit. If it's set, clear it. If it's clear, set it.
func toggle_bit(b : int) -> void:
	if is_set(b):
		clear_bit(b)
	else:
		set_bit(b)

## Test if a bit is set or not. Returns true if it is, otherwise false.
func is_set(b) -> bool:
	return (value & (1 << b)) == (1 << b)

## Set the whole bitfield value
func set_value(v : int) -> void:
	value = v

## Get the whole bitfield value
func get_value() -> int:
	return value
