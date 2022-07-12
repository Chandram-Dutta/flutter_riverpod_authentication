import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/authentication/presentation/controllers/sign_in_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignInScreen extends ConsumerWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<void> state = ref.watch(signInScreenControllerProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign In'),
        centerTitle: true,
      ),
      body: Center(
        child: SizedBox(
          height: 50,
          width: 200,
          child: ElevatedButton(
            onPressed: state.isLoading
                ? null
                : () => ref
                    .read(signInScreenControllerProvider.notifier)
                    .signInAnonymously(),
            child: state.isLoading
                ? CupertinoActivityIndicator(
                    color: Theme.of(context).colorScheme.primary,
                  )
                : const Text('Sign in anonymously'),
          ),
        ),
      ),
    );
  }
}
