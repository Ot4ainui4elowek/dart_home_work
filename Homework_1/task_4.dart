bool isLeapYear(int year) =>
    (year % 4 == 0 && year % 100 != 0) || (year % 400 == 0 && year % 100 == 0);

void main() {
  print(isLeapYear(1900) ? 'Високосный год' : 'Не високосный год'); //false
  print(isLeapYear(2024) ? 'Високосный год' : 'Не високосный год'); //true
}
