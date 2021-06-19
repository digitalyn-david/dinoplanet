import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class DavidFirebaseUser {
  DavidFirebaseUser(this.user);
  final User user;
  bool get loggedIn => user != null;
}

DavidFirebaseUser currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<DavidFirebaseUser> davidFirebaseUserStream() => FirebaseAuth.instance
    .authStateChanges()
    .debounce((user) => user == null && !loggedIn
        ? TimerStream(true, const Duration(seconds: 1))
        : Stream.value(user))
    .map<DavidFirebaseUser>((user) => currentUser = DavidFirebaseUser(user));
