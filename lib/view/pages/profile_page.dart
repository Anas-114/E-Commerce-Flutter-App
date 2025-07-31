
import 'package:flutter/material.dart';


class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Profile',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.orange[600],
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const SizedBox(height: 20),
            // Profile Picture
            CircleAvatar(
              radius: 50,
              backgroundColor: Colors.orange[200],
              child: Icon(Icons.person, size: 60, color: Colors.orange[600]),
            ),
            const SizedBox(height: 16),
            const Text(
              'John Doe',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const Text(
              'john.doe@email.com',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 30),

            // Profile Options
            buildProfileOption(Icons.person_outline, 'Edit Profile'),
            buildProfileOption(Icons.location_on_outlined, 'Addresses'),
            buildProfileOption(Icons.payment_outlined, 'Payment Methods'),
            buildProfileOption(Icons.history_outlined, 'Order History'),
            buildProfileOption(Icons.notifications_outlined, 'Notifications'),
            buildProfileOption(Icons.help_outline, 'Help & Support'),
            buildProfileOption(Icons.logout, 'Logout', isLogout: true),
          ],
        ),
      ),
    );
  }

  
}
// Place this OUTSIDE the ProfilePage class (below or above)
Widget buildProfileOption(IconData icon, String title, {bool isLogout = false, VoidCallback? onTap}) {
  return Card(
    margin: const EdgeInsets.only(bottom: 8),
    child: ListTile(
      leading: Icon(icon, color: isLogout ? Colors.red : Colors.orange[600]),
      title: Text(
        title,
        style: TextStyle(
          color: isLogout ? Colors.red : Colors.black,
          fontWeight: FontWeight.w500,
        ),
      ),
      trailing: const Icon(Icons.chevron_right),
      onTap: onTap ?? () {},
    ),
  );
}
