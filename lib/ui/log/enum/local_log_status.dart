import 'dart:ui';

enum LocalLogStatus{
  LIGHT('LIGHT',Color(0xFF7EB885)),
  MODERATE('MODERATE',Color(0xFFD0C047)),
  SEVERE('SEVERE',Color(0xFFFA7237)),
  EXTREME('EXTREME',Color(0xFFFB0606));

  final String name;
  final Color color;

  const LocalLogStatus(this.name, this.color);

}
