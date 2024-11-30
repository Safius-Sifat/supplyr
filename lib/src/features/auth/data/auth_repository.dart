import 'package:drift/drift.dart';

import '../../../utils/database.dart';
import '../../../utils/in_memory_store.dart';

class AuthRepository {
  final AppDatabase _database;
  AuthRepository(AppDatabase database) : _database = database;
  final _authState = InMemoryStore<AppUserData?>(null);

  Stream<AppUserData?> authStateChanges() => _authState.stream;
  AppUserData? get currentUser => _authState.value;

  Future<void> signInWithEmailAndPassword(String email, String password) async {
    final query = _database.select(_database.appUser)
      ..where((u) => u.email.equals(email) & u.password.equals(password));
    final user = await query.getSingleOrNull();
    _authState.value = user;
    // check the given credentials agains each registered user
    // for (final u in _users) {
    //   // matching email and password
    //   if (u.email == email && u.password == password) {
    //     _authState.value = u;
    //     return;
    //   }
    //   // same email, wrong password
    //   if (u.email == email && u.password != password) {
    //     throw WrongPasswordException();
    //   }
    // }
    // throw UserNotFoundException();
  }

  Future<void> createUserWithEmailAndPassword(
      String email, String password) async {
    _database.into(_database.appUser).insert(AppUserCompanion.insert(
          email: email,
          password: password,
        ));
    // check if the email is already in use
    // for (final u in _users) {
    //   if (u.email == email) {
    //     throw EmailAlreadyInUseException();
    //   }
    // }
    // // minimum password length requirement
    // if (password.length < 8) {
    //   throw WeakPasswordException();
    // }
    // // create new user
    // _createNewUser(email, password);
  }

  Future<void> signOut() async {
    _authState.value = null;
  }

  void dispose() => _authState.close();
}
