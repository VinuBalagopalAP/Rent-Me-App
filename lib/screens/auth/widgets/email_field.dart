import 'package:flutter/material.dart';

import '../../../utils/theme.dart';

class EmailField extends StatefulWidget {
  const EmailField({Key? key}) : super(key: key);

  @override
  State<EmailField> createState() => _EmailFieldState();
}

class _EmailFieldState extends State<EmailField> {
  /// [ emailController ] is used to control the [ email ] field.
  final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
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
  }
}
