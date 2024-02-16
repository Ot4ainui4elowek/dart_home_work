double getAverageArithmetics(List<int> listNumbers) {
  double average = 0.0;
  listNumbers.forEach((number) => average += number);
  return average / listNumbers.length;
}

final array = [1, 2, 3, 4, 5, 6];
void main() {
  print(getAverageArithmetics(array)); //3.5
}
