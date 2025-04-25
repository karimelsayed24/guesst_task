import 'package:flutter/material.dart';

import '../../../notifications/presentation/pages/notifications_page.dart';

class ProfileDataListTile extends StatelessWidget {
  const ProfileDataListTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: const CircleAvatar(
        backgroundImage: AssetImage('assets/images/profile_image.png'),
      ),
      title: const Text(
        'Good Morning',
        style: TextStyle(
          fontSize: 12,
          color: Colors.grey,
        ),
      ),
      subtitle: const Text(
        'Mahmoud Meki',
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
      trailing: Stack(
        children: [
          IconButton(
            icon: const Icon(Icons.notifications_outlined),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const NotificationsPage()),
              );
            },
          ),
          Positioned(
            right: 10,
            top: 10,
            child: Container(
              width: 10,
              height: 10,
              decoration: const BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
