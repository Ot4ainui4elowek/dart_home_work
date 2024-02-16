List<int> steps(int length, int steps) {
  List<int> distance = [];
  for (int i = length; i <= length * steps + 1; i += length) {
    distance.add(i);
  }
  return distance;
}

void main() {
  print(steps(3, 4));
}
