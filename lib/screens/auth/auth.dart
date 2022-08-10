import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../screens/auth/widgets/google_button.dart';
import '../../utils/theme.dart';

class AuthPage extends StatefulWidget {
  static const routeName = '/auth';

  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

/// [ _PasswordVisible ] is to toggle the password visibility.
bool _passwordVisible = false;

@override
void initState() {
  _passwordVisible;
}

class _AuthPageState extends State<AuthPage> {
  /// [ Form Key ] is used to validate the form.
  final _formKey = GlobalKey<FormState>();

  /// [ emailController ] is used to control the [ email ] field.
  final emailController = TextEditingController();

  /// [ passwordController ] is used to control the [ password ] field.
  final passwordController = TextEditingController();

  /// [ confirmPasswordController ] is used to confirm the [ password ] field.
  final confirmPasswordController = TextEditingController();

  bool _toggleSection = true;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    /// [ emailField ] is used to display the [ email ] field.
    final emailField = TextFormField(
      autofocus: false,
      controller: emailController,
      enableSuggestions: true,
      keyboardType: TextInputType.emailAddress,

      /// [ textInputAction ] is used to move to the [ next field  ] when the user presses the [ next ] key.
      textInputAction: TextInputAction.next,

      decoration: InputDecoration(
        labelText: 'Email',
        hintText: 'Enter your email',
        icon: const Icon(Icons.email, color: StoreTheme.whitish),
        labelStyle: const TextStyle(color: StoreTheme.whitish),
        hintStyle: const TextStyle(color: StoreTheme.black),
        contentPadding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
          borderSide: BorderSide(color: StoreTheme.whitish),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
          borderSide: BorderSide(color: StoreTheme.black),
        ),
      ),

      /// [ value ] is the value of the [ email ] field.
      validator: (value) {
        /// [ value!.isEmpty ] is used to check if the [ email ] field is empty.
        if (value!.isEmpty) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Please enter your email'),
            ),
          );
        }

        /// [ emailPattern & regex ] is used to validate the [ email ].
        Pattern emailPattern =
            r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
            r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
            r"{0,253}[a-zA-Z0-9])?)*$";

        RegExp emailRegex = RegExp(emailPattern.toString());

        /// [ !regex.hasMatch(value) ] is used to validate the [ email ] field.
        if (!emailRegex.hasMatch(value.toString())) {
          ScaffoldMessenger.of(context).showSnackBar(
            /// [ snackBar ] is used to show the error message.
            const SnackBar(
              content: Text('Please enter a valid email'),
            ),
          );
        }
        return null;
      },

      /// [ onSaved ] is used to save the [ email ] field.
      onSaved: (value) {
        emailController.text = value!.toString();
      },
    );

    /// [ passwordField ] is used to show the [ password ] field.
    final passwordField = TextFormField(
        autofocus: false,
        controller: passwordController,
        enableSuggestions: false,
        obscureText: !_passwordVisible,

        /// [ textInputAction ] is used to [ close the keyboard ] when the user presses the [ done ] key.
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
            labelText: 'Password',
            hintText: 'Enter your password',
            icon: const Icon(Icons.vpn_key, color: StoreTheme.whitish),
            suffixIcon: IconButton(
                onPressed: () {
                  /// Update the state i.e. [ toogle the state of passwordVisible ] variable

                  setState(() {
                    _passwordVisible = !_passwordVisible;
                  });
                },
                icon: Icon(
                  /// Based on [ passwordVisible ] state choose the icon
                  _passwordVisible ? Icons.visibility : Icons.visibility_off,
                  color: StoreTheme.whitish,
                )),
            labelStyle: const TextStyle(color: StoreTheme.whitish),
            hintStyle: const TextStyle(color: StoreTheme.black),
            contentPadding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
            enabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                borderSide: BorderSide(
                  color: StoreTheme.whitish,
                )),
            focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              borderSide: BorderSide(color: StoreTheme.black),
            )),

        /// [ value ] is the value of the [ email ] field.
        validator: (value) {
          /// [ value!.isEmpty ] is used to validate the [ password ] field.
          if (value!.isEmpty) {
            /// [ snackBar ] is used to show the error message.
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Please enter your password')));

            /// [ passwordPattern & passwordRegex ] is used to validate the [ password ].

            String passwordPattern =
                r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';

            RegExp passwordRegex = RegExp(passwordPattern.toString());

            /// [ !passwordRegex.hasMatch(value) ] is used to validate the [ password ] field.
            if (!passwordRegex.hasMatch(value.toString())) {
              /// [ snackBar ] is used to show the error message.
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text(
                'Password should contain atleast one uppercase, one lowercase, one number and one special character',
              )));
            }

            /// [ value.lenth < 6 ] is used to check the length of the [ password ] field.
            value.length < 6 || value.length > 10
                ? ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: value.length > 10
                        ? const Text(
                            'Password too long, should maximum contains 10 characters.')
                        : const Text(
                            'Password too short, should minimum contains 6 characters.'),
                  ))
                : '';
            return null;
          }
          return null;
        },

        /// [ onSaved ] is used to save the [ email ] field.
        onSaved: (value) {
          passwordController.text = value!.toString();
        });

    /// [ passwordField ] is used to show the [ password ] field.
    final confirmPassword = TextFormField(
        autofocus: false,
        controller: confirmPasswordController,
        enableSuggestions: false,
        obscureText: !_passwordVisible,

        /// [ textInputAction ] is used to [ close the keyboard ] when the user presses the [ done ] key.
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
            labelText: 'Confirm Password',
            hintText: 'Confirm your password',
            icon: const Icon(Icons.vpn_key, color: StoreTheme.whitish),
            suffixIcon: IconButton(
                onPressed: () {
                  /// Update the state i.e. [ toogle the state of passwordVisible ] variable

                  setState(() {
                    _passwordVisible = !_passwordVisible;
                  });
                },
                icon: Icon(
                  /// Based on [ passwordVisible ] state choose the icon
                  _passwordVisible ? Icons.visibility : Icons.visibility_off,
                  color: StoreTheme.whitish,
                )),
            labelStyle: const TextStyle(color: StoreTheme.whitish),
            hintStyle: const TextStyle(color: StoreTheme.black),
            contentPadding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
            enabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                borderSide: BorderSide(
                  color: StoreTheme.whitish,
                )),
            focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              borderSide: BorderSide(color: StoreTheme.black),
            )),

        /// [ value ] is the value of the [ email ] field.
        validator: (value) {
          /// [ value!.isEmpty ] is used to validate the [ password ] field.
          if (value!.isEmpty) {
            /// [ snackBar ] is used to show the error message.
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Please enter your password')));

            /// [ passwordPattern & passwordRegex ] is used to validate the [ password ].

            String passwordPattern =
                r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';

            RegExp passwordRegex = RegExp(passwordPattern.toString());

            /// [ !passwordRegex.hasMatch(value) ] is used to validate the [ password ] field.
            if (!passwordRegex.hasMatch(value.toString())) {
              /// [ snackBar ] is used to show the error message.
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text(
                'Password should contain atleast one uppercase, one lowercase, one number and one special character',
              )));
            }

            /// [ value.lenth < 6 ] is used to check the length of the [ password ] field.
            value.length < 6 || value.length > 10
                ? ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: value.length > 10
                        ? const Text(
                            'Password too long, should maximum contains 10 characters.')
                        : const Text(
                            'Password too short, should minimum contains 6 characters.'),
                  ))
                : '';
            return null;
          }
          return null;
        },

        /// [ onSaved ] is used to save the [ email ] field.
        onSaved: (value) {
          passwordController.text = value!.toString();
        });

    /// [ forgotPassword ] is used to navigate to the [ ForgotPassword ] screen.
    final forgotPassword = Container(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        alignment: Alignment.topRight,
        child: const Text("Forgot Password?",
            style: TextStyle(
              fontSize: 12.0,
              color: Colors.black,
              decoration: TextDecoration.underline,
            )));

    /// [ account ] is used to toggle the text of the [ account ] button.
    final account = GestureDetector(
      onTap: () {
        setState(() {
          _toggleSection = !_toggleSection;
        });
      },
      child: Container(
        alignment: Alignment.center,
        child: RichText(
          text: TextSpan(
            text: _toggleSection
                ? "Don't have an account?"
                : "Already have an account?",
            style: const TextStyle(
              fontSize: 12.0,
              color: Colors.black,
              decoration: TextDecoration.underline,
            ),
            children: <TextSpan>[
              TextSpan(
                text: _toggleSection ? ' Sign up' : ' Login',
                style: const TextStyle(
                  fontSize: 12.0,
                  fontWeight: FontWeight.bold,
                  color: StoreTheme.whitish,
                  decoration: TextDecoration.none,
                ),
              )
            ],
          ),
        ),
      ),
    );

    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        backgroundColor: StoreTheme.primaryColor,
        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    _toggleSection
                        ? Container(
                            height: MediaQuery.of(context).size.height * 0.5,
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Flexible(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      Text(
                                        'Rent',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 70,
                                          fontFamily: 'MusticaPro',
                                        ),
                                      ),
                                      Text(
                                        'Me',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 70,
                                          fontFamily: 'MusticaPro',
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 10),
                                emailField,
                                const SizedBox(height: 10),
                                passwordField,
                                forgotPassword,
                              ],
                            ),
                          )
                        : SizedBox(
                            height: MediaQuery.of(context).size.height * 0.5,
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Flexible(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: const [
                                        Text(
                                          'Rent',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 70,
                                            fontFamily: 'MusticaPro',
                                          ),
                                        ),
                                        Text(
                                          'Me',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 70,
                                            fontFamily: 'MusticaPro',
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  emailField,
                                  const SizedBox(height: 10),
                                  passwordField,
                                  const SizedBox(height: 10),
                                  confirmPassword,
                                ],
                              ),
                            ),
                          ),
                    account,
                    const SizedBox(height: 10.0),
                    const Text('or', style: TextStyle(fontSize: 12.0)),
                    const GoogleButton(),
                  ],
                ),
              ),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            _toggleSection ? signIn : signUp;
          },
          label: _toggleSection ? const Text('Login') : const Text('Sign Up'),
          foregroundColor: StoreTheme.white,
          backgroundColor: StoreTheme.blueGrey,
          icon: _toggleSection
              ? const Icon(Icons.login_rounded)
              : const Icon(Icons.person_add_rounded),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }

  Future signIn() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
    );
  }

  Future signUp() async {
    if (passwordMatch()) {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
    }
  }

  passwordMatch() {
    if (passwordController.text.trim() ==
        confirmPasswordController.text.trim()) {
      return ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
        'Password matched',
      )));
    }
    return ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text(
      'Enter the password again',
    )));
  }
}
