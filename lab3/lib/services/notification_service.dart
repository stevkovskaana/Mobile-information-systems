import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class NotificationService {

  static final NotificationService _instance = NotificationService._internal();
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  factory NotificationService() => _instance;

  NotificationService._internal();

  Future<void> initialize() async {

    NotificationSettings settings = await _firebaseMessaging.requestPermission();
    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print("User granted permission for notifications.");
    }

    String? token = await _firebaseMessaging.getToken();
    if (token != null) {
      print("Device token: $token");
      await sendTokenToServer(token);
    } else {
      print("Failed to retrieve device token.");
    }

    _firebaseMessaging.onTokenRefresh.listen((newToken) {
      print("Token refreshed: $newToken");
      sendTokenToServer(newToken);
    });

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print("Received a message: ${message.notification?.title}");
    });
  }

  Future<void> sendTokenToServer(String token) async {
    const String serverUrl = "https://your-backend-server.com/api/save-token";
    try {
      await http.post(
        Uri.parse(serverUrl),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'token': token}),
      );
    } catch (e) {
      print("Error sending token to server: $e");
    }
  }
}

