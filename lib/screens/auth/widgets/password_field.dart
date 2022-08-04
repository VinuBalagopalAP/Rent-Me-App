import 'package:flutter/material.dart';

import '../../../utils/theme.dart';

class PasswordField extends StatefulWidget {
  const PasswordField({Key? key}) : super(key: key);

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

/// [ _PasswordVisible ] is to toggle the password visibility.
bool _passwordVisible = false;

@override
void initState() {
  _passwordVisible;
}

class _PasswordFieldState extends State<PasswordField> {
  /// [ passwordController ] is used to control the [ password ] field.
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
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
          ),
        ),
        labelStyle: const TextStyle(color: StoreTheme.whitish),
        hintStyle: const TextStyle(color: StoreTheme.black),
        contentPadding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
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
          value.length < 6
              ? ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                        'Password too short, should minimum contains 6 characters.'),
                  ),
                )
              : '';
          return null;
        }
        return null;
      },

      /// [ onSaved ] is used to save the [ email ] field.
      onSaved: (value) {
        passwordController.text = value!.toString();
      },
    );
  }
}
