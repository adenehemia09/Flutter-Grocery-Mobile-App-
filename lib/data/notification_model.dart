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

var notificationModelList = [
  const NotificationModel(
    icon: Icons.email,
    date: '7 juni, 24:00',
    messageType: 'Info',
    title: "Your 1 kg tomato order will be sent immediately by courier.",
    message:
        "Your order has been successful and will be sent by courier to your home.",
  ),
  const NotificationModel(
    icon: Icons.lock,
    date: '7 juni, 24:00',
    messageType: 'Transaction',
    title: "Successful transaction",
    message:
        "Your order has been successful and will be sent by courier to your home.",
  ),
  const NotificationModel(
    icon: Icons.update,
    date: '7 juni, 24:00',
    messageType: 'Info',
    title: "Waiting for payment",
    message:
        "We need payment confirmation from you, please click the confirm button.",
  ),
];
