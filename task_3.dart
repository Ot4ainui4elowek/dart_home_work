String getSorted(List<int> listNumbers) {
  listNumbers.sort((a, b) => a - b);
  return listNumbers.join(' ');
}

final array = [1, 6, 3, 55, 9, -3];
void main() {
  print(getSorted(array));
}
