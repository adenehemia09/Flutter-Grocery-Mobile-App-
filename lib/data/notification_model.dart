import 'package:flutter/material.dart';

class NotificationModel {
  final IconData icon;
  final String messageType;
  final String date;
  final String title;
  final String message;

  const NotificationModel({
    required this.icon,
    required this.messageType,
    required this.date,
    required this.title,
    required this.message,
  });
}

var newNotificationList = [
  /*
      1. Add Item
      2. Waiting payment
      3. Success transaction
      4. Sent Order
  */
];
