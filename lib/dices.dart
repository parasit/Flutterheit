import 'dart:math';

main() {
  int result;
  var rng = Random();
  for (var i = 0; i < 10; i++) {
    result = rng.nextInt(100);
    print("$i: $result");
  }
}
