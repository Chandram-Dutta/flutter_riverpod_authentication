import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class AuthRepository {
  // emits a new value every time the authentication state changes
  Stream<User?> authStateChanges();

  Future<void> signInAnonymously();

  Future<void> signOut();
}

class FireAuthRepository extends AuthRepository {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  FireAuthRepository();
  @override
  Stream<User?> authStateChanges() {
    return _firebaseAuth.authStateChanges();
  }

  @override
  Future<void> signInAnonymously() async {
    await _firebaseAuth.signInAnonymously();
  }

  @override
  Future<void> signOut() async {
    await Future.delayed(const Duration(seconds: 2));
    return await _firebaseAuth.signOut();
  }
}

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return FireAuthRepository();
});

final authStateProvider = StreamProvider<User?>((ref) {
  return ref.read(authRepositoryProvider).authStateChanges();
});
