String getReversedString(String string) {
  List<String> newList = string.split(' ');
  newList.removeWhere((word) => word == '');
  return newList.reversed.join(' ');
}

final String str = 'Я строка     которую     отформатируют';
void main() {
  print(str);
  print(getReversedString(str));
}
