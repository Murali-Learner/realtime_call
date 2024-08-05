import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:realtime_call/calls/calls_page.dart';
import 'package:realtime_call/extensions/context_extensions.dart';
import 'package:realtime_call/extensions/spacer_extension.dart';
import 'package:realtime_call/extensions/toast_utils.dart';
import 'package:realtime_call/providers/auth_provider.dart';

class SignUpPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(labelText: 'Password'),
            ),
            20.vSpace,
            Consumer<AuthProvider>(builder: (context, provider, _) {
              return provider.authLoader
                  ? const CircularProgressIndicator.adaptive()
                  : ElevatedButton(
                      onPressed: () async {
                        final email = _emailController.text;
                        final password = _passwordController.text;
                        if (email.isEmpty && password.isEmpty) {
                          ToastUtils.showErrorToast(
                              'Enter Email and passwords correctly');
                          return;
                        }
                        try {
                          await Provider.of<AuthProvider>(context,
                                  listen: false)
                              .signUp(email, password);
                          context.push(navigateTo: const CallsPage());
                        } catch (e) {
                          print('Error: $e');
                        }
                      },
                      child: const Text('Sign Up'),
                    );
            }),
            TextButton(
              onPressed: () {
                context.pop();
              },
              child: const Text('Already have an account? Login'),
            ),
          ],
        ),
      ),
    );
  }
}
