import 'package:flutter_login/authentication/data/repositories/auth_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Create a StateNotifier subclass using AsyncValue<void> as the state
class SignInScreenController extends StateNotifier<AsyncValue<void>> {
  SignInScreenController({required this.authRepository})
      // set the initial value
      : super(const AsyncData<void>(null));

  final AuthRepository authRepository;

  Future<void> signInAnonymously() async {
    // set the state to loading
    state = const AsyncLoading<void>();
    // call `authRepository.signInAnonymously` and await for the result
    state = await AsyncValue.guard<void>(authRepository.signInAnonymously);
  }
}

final signInScreenControllerProvider =
    // StateNotifierProvider takes the controller class and state class as type arguments
    StateNotifierProvider.autoDispose<SignInScreenController, AsyncValue<void>>(
        (ref) {
  return SignInScreenController(
    authRepository: ref.watch(authRepositoryProvider),
  );
});
