import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:realtime_call/auth/signup_page.dart';
import 'package:realtime_call/calls/calls_page.dart';
import 'package:realtime_call/extensions/context_extensions.dart';
import 'package:realtime_call/extensions/toast_utils.dart';
import 'package:realtime_call/providers/auth_provider.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            TextFormField(
              controller: _passwordController,
              decoration: const InputDecoration(labelText: 'Password'),
            ),
            const SizedBox(height: 20),
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
                              .signIn(email, password);
                          context.push(navigateTo: const CallsPage());
                        } catch (e) {
                          print('Error: $e');
                        }
                      },
                      child: const Text('Login'),
                    );
            }),
            TextButton(
              onPressed: () {
                context.push(navigateTo: SignUpPage());
              },
              child: const Text('Don\'t have an account? Sign Up'),
            ),
          ],
        ),
      ),
    );
  }
}
