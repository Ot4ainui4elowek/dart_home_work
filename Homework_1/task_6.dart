List<num> getEven(List<num> list) {
  list.removeWhere((number) => number % 2 != 0);
  return list;
}

final array = [1, 6, 2.0, 3, 54.0, 9, -3.0, 4, 123, -20];
void main() {
  print(getEven(array));
}
