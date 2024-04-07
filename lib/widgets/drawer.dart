import 'package:empat_flutter_week_6/state/user_model.dart';
import 'package:empat_flutter_week_6/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:octo_image/octo_image.dart';

class DrawerWidget extends StatelessWidget {
  final UserModel user;

  const DrawerWidget({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: CColors.light,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          DrawerHeaderWidget(user: user),
          DrawerBodyWidget(user: user),
        ],
      ),
    );
  }
}

class DrawerBodyWidget extends StatelessWidget {
  final UserModel user;

  const DrawerBodyWidget({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: const Icon(Icons.account_balance, size: 30),
          title: const Text('Balance'),
          subtitle: Text('${user.balance}0 UAH'),
          onTap: () {},
        ),
        ListTile(
          leading: const Icon(Icons.account_circle, size: 30),
          title: const Text('Profile'),
          subtitle: Text(user.email),
          onTap: () {},
        ),
        ListTile(
          leading: const Icon(Icons.call, size: 30),
          title: const Text('Contact us'),
          subtitle: null,
          onTap: () {},
        ),
        ListTile(
          leading: const Icon(Icons.settings, size: 30),
          title: const Text('Settings'),
          subtitle: null,
          onTap: () {},
        ),
      ],
    );
  }
}

class DrawerHeaderWidget extends StatelessWidget {
  final UserModel user;
  const DrawerHeaderWidget({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
      padding: const EdgeInsets.all(0),
      decoration: const BoxDecoration(
        color: CColors.dark,
      ),
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: CColors.light,
            radius: 50,
            backgroundImage: AssetImage(user.imageAsset),
          ),
          const SizedBox(height: 20),
          Text(
            '${user.name} ${user.surname}',
            style: const TextStyle(
              color: CColors.light,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
