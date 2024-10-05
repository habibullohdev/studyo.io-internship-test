import 'dart:math';

int generateRandomNumberTop() {
  var random = Random();
  return random.nextInt(10) + 1;
}

int generateRandomNumberBottom() {
  var random = Random();
  return random.nextInt(100) + 1;
}
