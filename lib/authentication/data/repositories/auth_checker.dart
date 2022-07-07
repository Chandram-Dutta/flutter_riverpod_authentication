import 'package:flutter/material.dart';
import 'package:flutter_login/authentication/data/repositories/auth_repository.dart';
import 'package:flutter_login/authentication/presentation/screens/sign_in.dart';
import 'package:flutter_login/home/presentation/screens/home.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../presentation/screens/loading_screen.dart';

class AuthChecker extends ConsumerWidget {
  const AuthChecker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authStateProvider);
    return authState.when(
      data: (data) {
        if (data != null) {
          return const HomeScreen();
        }
        return const SignInScreen();
      },
      loading: () => const LoadingScreen(),
      error: (e, trace) => const Center(child: Icon(Icons.error)),
    );
  }
}
