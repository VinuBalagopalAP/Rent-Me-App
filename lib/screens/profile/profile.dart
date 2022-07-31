import 'package:flutter/material.dart';
import 'package:rent_me/utils/theme.dart';
import 'package:rent_me/widgets/profile_options.dart';

class ProfilePage extends StatelessWidget {
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
          // ElevatedButton.icon(
          //   onPressed: () {},
          //   icon: const Icon(Icons.logout_rounded),
          //   label: const Text('Logout'),
          // ),
          SizedBox(height: 10),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
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
