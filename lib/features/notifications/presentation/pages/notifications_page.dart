import 'package:flutter/material.dart';

import '../../domain/models/notification.dart';
import '../widgets/general_notification_cards.dart';
import '../widgets/job_notification_card.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({super.key});

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Notifications',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        bottom: TabBar(
          controller: _tabController,
          labelColor: const Color(0xff246BFE),
          unselectedLabelColor: Colors.grey,
          indicatorColor: const Color(0xff246BFE),
          tabs: const [
            Tab(text: 'General'),
            Tab(text: 'New jobs'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: generalNotifications.length,
            itemBuilder: (context, index) {
              return GeneralNotificationCard(
                notification: generalNotifications[index],
              );
            },
          ),
          ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: jobNotifications.length,
            itemBuilder: (context, index) {
              return JobNotificationCard(
                notification: jobNotifications[index],
              );
            },
          ),
        ],
      ),
    );
  }
}
