double getAverageArithmetics(List<int> listNumbers) {
  return listNumbers.reduce((acum, number) => acum + number) /
      listNumbers.length;
}

final array = [1, 2, 3, 4, 5, 6];
void main() {
  print(getAverageArithmetics(array)); //3.5
}
