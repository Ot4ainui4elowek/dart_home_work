final String Function({required int x, int y}) someFunction =
    ({required int x, int y = 13}) => (x + y).toString();
void main() {
  print(someFunction(x: 23)); // 36
}
