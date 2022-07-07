import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/home/presentation/controllers/sign_out_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<void> state = ref.watch(signOutScreenControllerProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: state.isLoading
                ? null
                // otherwise, get the notifier and sign in
                : () => ref
                    .read(signOutScreenControllerProvider.notifier)
                    .signOut(),
            icon: state.isLoading
                ? const CupertinoActivityIndicator(
                    color: Colors.white,
                  )
                : const Icon(Icons.exit_to_app),
          )
        ],
      ),
      body: const Center(
        child: Text("You are signed In Anonymously"),
      ),
    );
  }
}
