//енамка с типами и, для удобности, их текстовым вариантом

enum Type {
  html('html'),
  json('json'),
  css('css'),
  pdf('pdf');

  const Type(
    this.text,
  );

  final String text;
}

//Собственно сам класс создания документов.
//Ради интереса добавил метод изменения имени файла

class Document {
  Type _type;
  String _name;
  String _path;
  final _date = DateTime.now().toString();

  Document(this._type, [this._name = 'New file'])
      : _path = 'user/documents/$_name.${_type.text}' {
    print('"${this._name}.${this._type.text}" has been created');
  }

  String get date => _date;
  String get path => this._path;
  String get name => _name;
  String get fullName => '$_name.${_type.text}';
  String get type => '$_type';

  void set name(String someName) {
    if (someName.isNotEmpty) {
      print(
          'The "$_name.${_type.text}" has been changed to "$someName.${_type.text}"');
      _name = someName;
    } else
      print('Error: The empty string cannot be a name!');
  }

  void displayFileInfo() {
    print('File: ${this.fullName}');
    print('Type: ${this._type}');
    print('Path: ${this.path}');
    print('Created: ${this.date}');
  }
}

void main() {
  final html = Document(Type.html, 'index');
  html.name = 'head';
  html.displayFileInfo();
  final noName = Document(Type.pdf);
  noName.name = '';
  noName.name = 'work';
}
