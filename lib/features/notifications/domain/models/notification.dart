import 'package:flutter/material.dart';

enum NotificationType {
  general,
  newJob,
}

enum NotificationStatus {
  unread,
  read,
}

class BaseNotification {
  final String id;
  final DateTime timestamp;
  final NotificationStatus status;

  BaseNotification({
    required this.id,
    required this.timestamp,
    this.status = NotificationStatus.unread,
  });

  String get formattedTimestamp {
    return '${timestamp.day} ${_getMonthName(timestamp.month)} ${timestamp.year} | ${_formatTime(timestamp)}';
  }

  String _getMonthName(int month) {
    const months = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December'
    ];
    return months[month - 1];
  }

  String _formatTime(DateTime time) {
    final hour = time.hour % 12;
    final period = time.hour < 12 ? 'AM' : 'PM';
    return '${hour == 0 ? 12 : hour}:${time.minute.toString().padLeft(2, '0')} $period';
  }
}

class GeneralNotification extends BaseNotification {
  final String title;
  final String description;
  final Color? labelColor;

  GeneralNotification({
    required super.id,
    required super.timestamp,
    required this.title,
    required this.description,
    this.labelColor,
    NotificationStatus status = NotificationStatus.unread,
  }) : super(status: status);
}

class JobNotification extends BaseNotification {
  final String jobTitle;
  final String companyName;
  final IconData icon;
  final Color iconColor;

  JobNotification({
    required super.id,
    required super.timestamp,
    required this.jobTitle,
    required this.companyName,
    required this.icon,
    required this.iconColor,
    NotificationStatus status = NotificationStatus.unread,
  }) : super(status: status);
}

// Static data
final generalNotifications = [
  GeneralNotification(
    id: '1',
    timestamp: DateTime(2024, 4, 28, 12, 8),
    title: 'Security update',
    description:
        'Your account security has been updated. Please review the changes.',
    labelColor: const Color(0xfff69a28),
  ),
  GeneralNotification(
    id: '2',
    timestamp: DateTime(2024, 4, 28, 11, 30),
    title: 'Password changed',
    description: 'Your password has been successfully changed.',
  ),
  GeneralNotification(
    id: '3',
    timestamp: DateTime(2024, 4, 27, 15, 45),
    title: 'Job has been updated',
    description:
        'The job you applied for has been updated. Check the new requirements.',
    labelColor: const Color(0xff246bfe),
  ),
];

final jobNotifications = [
  JobNotification(
    id: '1',
    timestamp: DateTime(2024, 4, 28, 12, 8),
    jobTitle: 'Product Management',
    companyName: 'Google LLC',
    icon: Icons.business,
    iconColor: Colors.blue,
  ),
  JobNotification(
    id: '2',
    timestamp: DateTime(2024, 4, 28, 11, 30),
    jobTitle: 'UX Researcher',
    companyName: 'Microsoft',
    icon: Icons.design_services,
    iconColor: Colors.purple,
  ),
  JobNotification(
    id: '3',
    timestamp: DateTime(2024, 4, 27, 15, 45),
    jobTitle: 'Frontend Developer',
    companyName: 'Apple',
    icon: Icons.code,
    iconColor: Colors.green,
  ),
];
