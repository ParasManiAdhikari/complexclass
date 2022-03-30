import 'main.dart';

class Quaternion extends Complex {
  num jnum;
  Quaternion(num real, num imaginary, this.jnum) : super(real, imaginary);

  @override
  String toString() {
    return (jnum <= 0)
        ? super.toString() + " - ${jnum.abs()}j"
        : super.toString() + " + ${jnum}j";
  }
}
