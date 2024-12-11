import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:untitled/shared/components/components.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool isPassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: const Color(0xFF0882A1),
        title: const Text(
          'Login',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                    'https://cdn.dribbble.com/users/9578072/screenshots/17016650/media/71383774e4ad325ac3442cd04fd39961.jpg?resize=1000x750&vertical=center',
                  ),
                  fit: BoxFit.cover),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    const SizedBox(
                      width: double.infinity,
                      child: Text(
                        'Login',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 40,
                            fontWeight: FontWeight.w900),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    defaultFormField(
                      onTap: (){},
                        prefixIcon: Icons.email,
                        controller: emailController,
                        label: 'EmailAddress',
                        keyboardType: TextInputType.emailAddress,
                        validate: (value) {
                          if (value!.isEmpty) {
                            return 'Email shouldn\'t be empty';
                          }

                          return null;
                        }),
                    const SizedBox(
                      height: 16,
                    ),
                    defaultFormField(
                      onTap: (){},
                      suffixPressed: () {
                        setState(() {
                          isPassword = !isPassword;
                        });
                      },
                      prefixIcon: Icons.lock,
                      suffixIcon: isPassword
                          ? FontAwesomeIcons.eye
                          : FontAwesomeIcons.eyeSlash,
                      controller: passwordController,
                      label: 'Password',
                      isPassword: isPassword,
                      keyboardType: TextInputType.phone,
                      validate: (value) {
                        if (value!.isEmpty) {
                          return 'Password should\'t be empty';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    defaultButton(
                        emailController: emailController.text,
                        passwordController: passwordController.text,
                        text: 'LOGIN',
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            print(emailController);
                            print(passwordController);
                          }
                        }),
                    Container(
                      color: Colors.black87,
                      child: Row(
                        children: [
                          const Text(
                            'Don\'t have an account?',
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          TextButton(
                            onPressed: () {},
                            style: ButtonStyle(
                                foregroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.blue),
                                textStyle: MaterialStateProperty.all<TextStyle>(
                                  const TextStyle(
                                    fontSize: 20,
                                  ),
                                )),
                            child: const Text('Register Now'),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
