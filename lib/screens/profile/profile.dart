import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../utils/theme.dart';
import '../../screens/profile/widgets/profile_options.dart';
import '../../provider/auth/google_sign_in_provider.dart';

class ProfilePage extends StatelessWidget {
  static const routeName = '/auth';

  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: const [
          ProfileOptions(
            icon: Icon(
              Icons.pie_chart,
              color: StoreTheme.primaryColor,
            ),
            subtitle: 'View and manage past orders',
            title: 'Orders',
          ),
          ProfileOptions(
            icon: Icon(
              Icons.markunread_mailbox,
              color: StoreTheme.primaryColor,
            ),
            subtitle: 'Add or manage delivery addresses',
            title: 'Addresses',
          ),
          ProfileOptions(
            icon: Icon(
              Icons.chat_bubble_outline,
              color: StoreTheme.primaryColor,
            ),
            subtitle: 'Connect with us for queries or suggestions',
            title: 'Contact Us',
          ),
          ProfileOptions(
            icon: Icon(
              Icons.more,
              color: StoreTheme.primaryColor,
            ),
            subtitle: 'Terms and conditions, policies and more',
            title: 'Read More',
          ),
          SizedBox(height: 10),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          final provider =
              Provider.of<GoogleSignInProvider>(context, listen: false);

          provider.googleLogout();
          debugPrint('Google Logout');
        },
        label: const Text('Logout'),
        icon: const Icon(Icons.logout_rounded),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
