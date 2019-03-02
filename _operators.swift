// bitwise NOT (~) Operator
let initialBits: UInt8 = 0b00001111
let invertBits = ~initialBits

// bitwise AND (&) Operator
let firstSixBits: UInt8 = 0b11111100
let lastSixBits: UInt8 = 0b00111111

let middleFourBits = firstSixBits & lastSixBits

// bitwise OR (|) Operator
let someBits: UInt8 = 0b10110010
let moreBits: UInt8 = 0b01011110

let combinedBits = someBits | moreBits

// bitwsie XOR (^) Operator
let firstBits: UInt8 = 0b00010100
let otherBits: UInt8 = 0b00000101

let outputBits = firstBits ^ otherBits

// logical shift operations
let shiftBits: UInt8 = 4

shiftBits << 1
shiftBits << 2
shiftBits << 5
shiftBits << 6
shiftBits >> 2

let pink: UInt32 = 0xCC6699
let redComponent = (pink & 0xFF0000) >> 16
let greenComponent = (pink & 0x00FF00) >> 8
let blueComponent = pink & 0x0000FF
