import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:leasing_car/presentation/features/animated_button.dart';
import 'package:leasing_car/presentation/features/custom_input_field.dart';
import 'package:leasing_car/presentation/features/glass_container.dart';
import 'package:leasing_car/presentation/features/snack_bar.dart';
import 'package:leasing_car/presentation/pages/auth_page/bloc/login_bloc.dart';

class SignUp extends StatelessWidget {
  SignUp({super.key});
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final FocusNode _focusNode1 = FocusNode();
  final FocusNode _focusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    void RegisterSuccesfull() {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          /// need to set following properties for best effect of awesome_snackbar_content
          elevation: 0,
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.transparent,
          content: AwesomeSnackbarContent(
            title: 'Registration succesful!',
            message: 'It\'s time for leasing!',

            /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
            contentType: ContentType.success,
          ),
        ),
      );
    }

    final bloc = BlocProvider.of<LoginBloc>(context);

    final themeof = Theme.of(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: themeof.colorScheme.primary,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/img/bg1.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            GlassContainer(
                widget: AppBar(
                  foregroundColor: Theme.of(context).colorScheme.inversePrimary,
                  bottomOpacity: 1,
                  backgroundColor: Colors.black12,
                ),
                height: null,
                width: null),
            const Padding(
              padding: EdgeInsets.only(
                left: 50,
                right: 50,
                bottom: 50,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: GlassContainer(
                widget: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    children: [
                      Center(
                        child: Text(
                          'Welcome back!',
                          style: themeof.textTheme.titleLarge!.copyWith(
                              color: Theme.of(context).colorScheme.primary),
                        ),
                      ),
                      Center(
                        child: Text(
                          'sign up for more functions',
                          style: themeof.textTheme.titleSmall!.copyWith(
                              color: Theme.of(context).colorScheme.secondary),
                        ),
                      ),
                    ],
                  ),
                ),
                height: null,
                width: null,
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            const SizedBox(
              height: 40,
            ),
            GlassContainer(
              widget: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InputField(
                      focusNode: _focusNode,
                      controller: emailController,
                      hintText: 'example@gmail.com',
                      topText: 'Email',
                      obscureText: false,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InputField(
                      focusNode: _focusNode1,
                      controller: passwordController,
                      hintText: 'qwerty',
                      topText: 'Password',
                      obscureText: true,
                    ),
                  ),
                ],
              ),
              height: null,
              width: null,
            ),
            const SizedBox(
              height: 15,
            ),
            GestureDetector(
              onTap: () {
                final int? code = checkAllIsNormal();
                if (code == 1) {
                  const snackBar = SnackBar(
                    /// need to set following properties for best effect of awesome_snackbar_content
                    elevation: 0,
                    behavior: SnackBarBehavior.floating,
                    backgroundColor: Colors.transparent,
                    content: AwesomeSnackbarContent(
                      title: 'Email error!',
                      message:
                          'Please check your email, is it correctly wroten?',

                      /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
                      contentType: ContentType.failure,
                    ),
                  );

                  ScaffoldMessenger.of(context)
                    ..hideCurrentSnackBar()
                    ..showSnackBar(snackBar);
                } else if (code == 2) {
                  const snackBar = SnackBar(
                    /// need to set following properties for best effect of awesome_snackbar_content
                    elevation: 0,
                    behavior: SnackBarBehavior.floating,
                    backgroundColor: Colors.transparent,
                    content: AwesomeSnackbarContent(
                      title: 'Password error!',
                      message:
                          'Please check your password, is it correctly wroten?',

                      /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
                      contentType: ContentType.failure,
                    ),
                  );

                  ScaffoldMessenger.of(context)
                    ..hideCurrentSnackBar()
                    ..showSnackBar(snackBar);
                }
                unFocusNodes();
                bloc.add(
                  SignUpWithEmailEvent(
                    email: emailController.text,
                    password: passwordController.text,
                  ),
                );
              },
              child: GlassContainer(
                widget: TextButton(
                  onPressed: () {
                    final int? code = checkAllIsNormal();
                    if (code == 1) {
                      const snackBar = SnackBar(
                        /// need to set following properties for best effect of awesome_snackbar_content
                        elevation: 0,
                        behavior: SnackBarBehavior.floating,
                        backgroundColor: Colors.transparent,
                        content: AwesomeSnackbarContent(
                          title: 'Email error!',
                          message:
                              'Please check your email, is it correctly wroten?',

                          /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
                          contentType: ContentType.failure,
                        ),
                      );

                      ScaffoldMessenger.of(context)
                        ..hideCurrentSnackBar()
                        ..showSnackBar(snackBar);
                    } else if (code == 2) {
                      const snackBar = SnackBar(
                        /// need to set following properties for best effect of awesome_snackbar_content
                        elevation: 0,
                        behavior: SnackBarBehavior.floating,
                        backgroundColor: Colors.transparent,
                        content: AwesomeSnackbarContent(
                          title: 'Password error!',
                          message:
                              'Please check your password, is it correctly wroten?',

                          /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
                          contentType: ContentType.failure,
                        ),
                      );

                      ScaffoldMessenger.of(context)
                        ..hideCurrentSnackBar()
                        ..showSnackBar(snackBar);
                    }
                    unFocusNodes();
                    bloc.add(
                      SignUpWithEmailEvent(
                        email: emailController.text,
                        password: passwordController.text,
                      ),
                    );
                  },
                  child: const Text(
                    'Login / Register',
                  ),
                ),
                height: null,
                width: null,
              ),
            ),
            BlocListener(
              bloc: bloc,
              child: Container(),
              listener: (context, state) {
                if (state is LoginDeniedState && state.isLogin == false) {
                  SnackBar snackBar = SnackBar(
                    /// need to set following properties for best effect of awesome_snackbar_content
                    elevation: 0,
                    behavior: SnackBarBehavior.floating,
                    backgroundColor: Colors.transparent,
                    content: AwesomeSnackbarContent(
                      title: 'Error!',
                      message: state.exception.code,

                      /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
                      contentType: ContentType.failure,
                    ),
                  );
                  ScaffoldMessenger.of(context)
                    ..hideCurrentSnackBar()
                    ..showSnackBar(snackBar);
                  unFocusNodes();
                }
                if (state is LoginDeniedState && state.isLogin == true) {
                  SnackBar snackBar = SnackBar(
                    /// need to set following properties for best effect of awesome_snackbar_content
                    elevation: 0,
                    behavior: SnackBarBehavior.floating,
                    backgroundColor: Colors.transparent,
                    content: AwesomeSnackbarContent(
                      title: 'Account doesn\'t exist!',
                      message: "${state.exception.code}.",

                      /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
                      contentType: ContentType.warning,
                    ),
                  );
                  ScaffoldMessenger.of(context)
                    ..hideCurrentSnackBar()
                    ..showSnackBar(snackBar);
                  unFocusNodes();
                }
                if (state is LoginWithEmailState && state.success == true) {
                  unFocusNodes();
                  RegisterSuccesfull();
                  Future.delayed(
                    const Duration(seconds: 1),
                  );
                  context.go(
                    '/home',
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  void unFocusNodes() {
    if (_focusNode.hasFocus) {
      _focusNode.unfocus();
    }
    if (_focusNode1.hasFocus) {
      _focusNode1.unfocus();
    }
  }

  //! func validator,
  int? checkAllIsNormal() {
    if (emailController.text.isEmpty || emailController.text.length < 7) {
      return 1;
    } else if (passwordController.text.isEmpty) {
      return 2;
    }
    return null;
  }
}
