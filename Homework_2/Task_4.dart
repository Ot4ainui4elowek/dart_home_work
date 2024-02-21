class User {
  String name;
  int age;
  String password;
  final String login;
  final DateTime _registrationDate = DateTime.now();

  User(
      {required this.name,
      required this.age,
      required this.password,
      required this.login});

  DateTime get registrationDate => _registrationDate;

  String userToString() =>
      'user {\n\tName: $name\n\tAge: $age\n\tRegistration_date: $_registrationDate\n\tid: $login\n}';

  bool equals(String password) => password == this.password;
}

final Map<String, User> userList = {};

class Registration {
  Map<String, User> users;
  Registration(this.users);
  void register(User user) {
    if (users.containsKey(user.login)) {
      print('Пользователь уже существует');
    } else {
      users.addAll({user.login: user});
    }
  }
}

class UserAutorization {
  final Map<String, User> _userList = {};
  Map<String, User> get userList => _userList;

  void authorize({required String login, required String password}) {
    if (!_userList.containsKey(login)) {
      print('Пользователь с логином $login не найден');
    } else if (_userList[login]!.equals(password)) {
      print('Вы авторизировались под пользователем ${_userList[login]!.name}');
    } else {
      print('Неверный пароль!');
    }
  }
}

void main() {
  final auth = UserAutorization();
  final reg = Registration(auth.userList);
  reg.register(
      User(name: 'Pavel', age: 19, password: 'password', login: 'pavel2005'));
  reg.register(
      User(name: 'Alex', age: 15, password: 'qwerty123', login: 'leha228'));
  reg.register(
      User(name: 'Kate', age: 25, password: 'kate69', login: '___kateee'));
  auth.authorize(login: 'pavel2005', password: 'password');
  auth.authorize(login: 'pavel2004', password: 'password');
  auth.authorize(login: '___kateee', password: 'password');
}
