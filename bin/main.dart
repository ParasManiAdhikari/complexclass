import 'dart:math';

import 'Quaternion.dart';

void main() {
  // Test 1, normal class methods
  var c = Complex(3, -2);
  var d = Complex(1, 4);
  print(c == d);
  var e = Complex.real(3);
  print(e.real);

  // Test 2, operator methods + - * static
  print(c * d);
  print(Complex.subtract(c, d)); // static method

  // Test 3, quaternion
  var q = Quaternion(1, 2, -3);
  print(q);
}

class Complex {
  num _real;
  num _imaginary;

  //Constructors
  Complex(this._real, this._imaginary);
  Complex.real(num real) : this(real, 0);
  Complex.imaginary(num imaginary) : this(0, imaginary);

  //Operator classes
  Complex operator +(other) {
    return Complex(_real + other._real, _imaginary + other._imaginary);
  }

  Complex operator -(other) {
    return Complex(_real - other._real, _imaginary - other._imaginary);
  }

  // (a + bi) * (c + di) = (ac - bd) + (ad + bc)i
  Complex operator *(other) {
    return Complex(_real * other._real - _imaginary * other._imaginary,
        _real * other._imaginary + _imaginary * other._real);
  }

  // Static Method (You dont need to create an instance to access this)
  static Complex subtract(Complex a, Complex b) {
    return Complex(a._real - b._real, a._imaginary - b._imaginary);
  }

  // Getters and Setters
  num get real => _real;
  num get imaginary => _imaginary;

  set real(num real) {
    _real = real;
  }

  set imaginary(num imaginary) {
    _imaginary = imaginary;
  }

// usual Object equal and tostring Methods
  bool operator ==(other) {
    if (other is! Complex) return false;
    return _real == other._real && _imaginary == other.imaginary;
  }

  @override
  String toString() {
    return (imaginary >= 0)
        ? "${_real} + ${_imaginary}i"
        : "${_real} - ${_imaginary.abs()}i";
  }
}
