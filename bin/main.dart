import 'dart:math';

void main() {
  var c = Complex(6, 2);
  var d = Complex(6, 2);

  print(c == d);

  var e = Complex.real(3);

  print(e.real);
}

class Complex {
  num _real;
  num _imaginary;

  //Constructors
  Complex(this._real, this._imaginary);
  Complex.real(num real) : this(real, 0);
  Complex.imaginary(num imaginary) : this(0, imaginary);

  // usual Object equal and tostring Methods
  bool operator ==(other) {
    if (other is! Complex) return false;
    return _real == other._real && _imaginary == other.imaginary;
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

  @override
  String toString() {
    return (imaginary >= 0)
        ? "${_real} + ${_imaginary}i"
        : "${_real} - ${_imaginary.abs()}i";
  }
}
