import 'package:flutter/material.dart';
import 'package:side_proj/shared/components.dart';

import '../../login/presentation/login_screen.dart';
import '../data/register_remote_data_source.dart';
import '../domain/repos/register_repo_imp.dart';

class RegisterScreenImpl extends StatefulWidget {
  const RegisterScreenImpl({super.key});

  @override
  State<RegisterScreenImpl> createState() => _RegisterScreenImplState();
}

class _RegisterScreenImplState extends State<RegisterScreenImpl> {
  TextEditingController nameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  bool visibility = true;

  @override
  Widget build(BuildContext context) {
    RegisterRepoImpl registerRepoImp = RegisterRepoImpl();
    RegisterRemoteDataSourceImpl registerRemoteDataSourceImpl =
        RegisterRemoteDataSourceImpl();
    return Scaffold(
      body: Column(
        children: [
          const CustomizedAppBar(),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: MediaQuery.sizeOf(context).width / 4.3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        width: 388,
                        height: 84,
                        child: Text(
                          'Build Your own System by Signing up',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 28,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      customizedTextFormField(
                          textEditingController: nameController,
                          hintText: 'User name',
                          textInputType: TextInputType.text),
                      const SizedBox(
                        height: 25,
                      ),
                      customizedTextFormField(
                          textEditingController: emailController,
                          hintText: 'Email',
                          textInputType: TextInputType.text),
                      const SizedBox(
                        height: 25,
                      ),
                      customizedTextFormField(
                          textEditingController: passwordController,
                          hintText: 'Password',
                          textInputType: TextInputType.visiblePassword,
                          suffix: visibility
                              ? const Icon(
                                  Icons.visibility_outlined,
                                  color: Colors.grey,
                                )
                              : const Icon(
                                  Icons.visibility_off_outlined,
                                  color: Colors.grey,
                                ),
                          secure: visibility,
                          show: () {
                            setState(() {
                              visibility = !visibility;
                            });
                          }),
                      const SizedBox(
                        height: 25,
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      CustomizedButton(
                          text: const Text(
                            'Sign up',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                            ),
                          ),
                          onPressed: () {
                            // save Data in fireStore
                            registerRemoteDataSourceImpl.createUser(
                              name: nameController.text,
                              email: emailController.text,
                            );

                            // Auth
                            registerRepoImp.userRegister(emailController.text,
                                passwordController.text, context);
                          }),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Already have account?',
                            style: TextStyle(
                                fontWeight: FontWeight.w400, fontSize: 18),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const LoginScreen()));
                            },
                            child: const Text(
                              ' Sign in',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 14),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 70,
                ),
                Image(
                  image: const AssetImage('assets/images/register.png'),
                  width: MediaQuery.sizeOf(context).width / 2.5,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
