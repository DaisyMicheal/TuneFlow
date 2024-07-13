import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        backgroundColor: Colors.black,
      ),
      body: Container(
        color: Colors.black,
        child: ListView(
          children: [
            _buildSettingsHeader(),
            _buildSettingsItem(
              context,
              title: 'Account Settings',
              icon: Icons.person,
              onTap: () {},
            ),
            _buildSettingsItem(
              context,
              title: 'Playback Settings',
              icon: Icons.play_circle_fill,
              onTap: () {},
            ),
            _buildSettingsItem(
              context,
              title: 'Download Settings',
              icon: Icons.download,
              onTap: () {},
            ),
            _buildSettingsItem(
              context,
              title: 'Notification Settings',
              icon: Icons.notifications,
              onTap: () {},
            ),
            _buildSettingsItem(
              context,
              title: 'Appearance Settings',
              icon: Icons.color_lens,
              onTap: () {},
            ),
            _buildSettingsItem(
              context,
              title: 'Privacy and Security',
              icon: Icons.security,
              onTap: () {},
            ),
            _buildSettingsItem(
              context,
              title: 'Language and Region',
              icon: Icons.language,
              onTap: () {},
            ),
            _buildSettingsItem(
              context,
              title: 'Connected Devices',
              icon: Icons.devices,
              onTap: () {},
            ),
            _buildSettingsItem(
              context,
              title: 'Support and Feedback',
              icon: Icons.support,
              onTap: () {},
            ),
            _buildSettingsItem(
              context,
              title: 'About',
              icon: Icons.info,
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingsHeader() {
    return Container(
      padding: EdgeInsets.all(16.0),
      color: Colors.black,
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: AssetImage('assets/taylor.jpg'),
            radius: 30,
          ),
          SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'John Doe',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'john.doe@example.com',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSettingsItem(BuildContext context, {required String title, required IconData icon, required VoidCallback onTap}) {
    return Column(
      children: [
        ListTile(
          leading: Icon(icon, color: Colors.orange),
          title: Text(title, style: TextStyle(color: Colors.white)),
          trailing: Icon(Icons.arrow_forward_ios, color: Colors.orange),
          onTap: onTap,
        ),
        Divider(color: Colors.grey[800], height: 1),
      ],
    );
  }
}
