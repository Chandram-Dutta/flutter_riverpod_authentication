import 'package:flutter_login/authentication/data/repositories/auth_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Create a StateNotifier subclass using AsyncValue<void> as the state
class SignOutScreenController extends StateNotifier<AsyncValue<void>> {
  SignOutScreenController({required this.authRepository})
      // set the initial value
      : super(const AsyncData<void>(null));

  final AuthRepository authRepository;

  Future<void> signOut() async {
    // set the state to loading
    state = const AsyncLoading<void>();
    // call `authRepository.signInAnonymously` and await for the result
    state = await AsyncValue.guard<void>(authRepository.signOut);
  }
}

final signOutScreenControllerProvider =
    // StateNotifierProvider takes the controller class and state class as type arguments
    StateNotifierProvider.autoDispose<SignOutScreenController,
        AsyncValue<void>>((ref) {
  return SignOutScreenController(
    authRepository: ref.watch(authRepositoryProvider),
  );
});
