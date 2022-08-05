import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../provider/providers.dart';
import '../../../utils/theme.dart';

class GoogleButton extends StatelessWidget {
  const GoogleButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        debugPrint('User trying to sign in with Google');

        final provider = Provider.of<GoogleSignInProvider>(
          context,
          listen: false,
        );

        provider.googleLogin();
      },
      child: Container(
        margin: const EdgeInsets.all(12.0),
        padding: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color: StoreTheme.whitish,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Image.network(
          'https://upload.wikimedia.org/wikipedia/commons/thumb/5/53/Google_%22G%22_Logo.svg/1024px-Google_%22G%22_Logo.svg.png',
          height: MediaQuery.of(context).size.height * 0.05,
        ),
      ),
    );
  }
}
