import 'dart:math';

class User {
  String name;
  int age;
  late final String id = this._generateId();
  final DateTime _registrationDate = DateTime.now();

  User({required this.name, required this.age});

  DateTime get registrationDate => _registrationDate;

  String _generateId() {
    const idLenght = 10;
    const String char = 'abcdefghijklmnopqrstuvwxyz0123456789';
    String id = '';
    for (int i = 0; i < idLenght; i++) {
      id += char[Random().nextInt(char.length)];
    }
    return id;
  }

  String userToString() =>
      'user {\n\tName: $name\n\tAge: $age\n\tRegistration_date: $_registrationDate\n\tid: $id\n}';
}

// Ошибки решил обработать и вывести в консоль, без всяких throw Exception :D
class UserAPI {
  List<User> _users = [];
  void addUser(String name, int age) {
    if (name.isEmpty || age <= 0) {
      print('ArgumentError: user has not been created');
    } else {
      User user = User(name: name, age: age);
      _users.add(user);
      print('INFO: User added: $name');
    }
  }

  void editUser({
    required String id,
    String? name,
  }) {
    final index = _users.indexWhere((user) => user.id == id);
    if (index == -1) {
      print('ERROR: User with given id "$id" not found!');
    } else {
      if (name != null) {
        print(
            'INFO: User name ${_users[index].name} has been changed to $name');
        _users[index].name = name;
        ;
      }
    }
  }

  void deleteUserById(String id) {
    final index = _users.indexWhere((user) => user.id == id);
    if (index == -1) {
      print('ERROR: User with given id "$id" not found!');
    } else {
      print('INFO: User deleted: ${_users[index].name}');
      _users.removeAt(index);
    }
  }

  User? getUserById(String id) {
    final index = _users.indexWhere((user) => user.id == id);
    if (index == -1) {
      return null;
    } else {
      return _users.removeAt(index);
    }
  }

  List<User>? getUserListByName(String name) {
    final someUsers = _users.where((user) => user.name == name).toList();
    if (someUsers.isEmpty) {
      print('ERROR: User with name: "$name" not found!');
      return null;
    } else {
      return someUsers;
    }
  }

  List<User> users() => _users;

  void set getUsers(List<User> users) {
    _users = users;
    print('INFO: User list have been received');
  }
}

final userList = [
  User(name: 'Petya', age: 9),
  User(name: 'Alex', age: 19),
  User(name: 'Kate', age: 12),
  User(name: 'Ann', age: 3),
  User(name: 'Petya', age: 39),
  User(name: 'Gabe', age: 69),
];

void main() {
  final usersDB = UserAPI();
  usersDB.getUsers = userList;
  usersDB.addUser('Nekit', 18);
  usersDB.getUserListByName('Petya')?.forEach((user) {
    print(user.userToString());
  });
  usersDB.editUser(id: usersDB.users()[0].id, name: 'Jack');
  print(usersDB.users()[0].userToString());
}
