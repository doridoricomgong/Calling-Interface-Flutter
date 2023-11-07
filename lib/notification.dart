
import 'package:flutter_local_notifications/flutter_local_notifications.dart'; 

class FlutterLocalNotification { 
  FlutterLocalNotification._(); 
  static FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin(); 
  static init() async { 
    AndroidInitializationSettings androidInitializationSettings = const AndroidInitializationSettings('mipmap/ic_launcher'); 
    DarwinInitializationSettings iosInitializationSettings = const DarwinInitializationSettings( requestAlertPermission: false, requestBadgePermission: false, requestSoundPermission: false, ); 
    InitializationSettings initializationSettings = InitializationSettings( android: androidInitializationSettings, iOS: iosInitializationSettings, ); 
    await flutterLocalNotificationsPlugin.initialize(initializationSettings); } 
    static requestNotificationPermission() { 
      flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation< IOSFlutterLocalNotificationsPlugin>() ?.requestPermissions( alert: true, badge: true, sound: true, ); 
    } 
    static Future<void> showNotification() async { 
      const AndroidNotificationDetails androidNotificationDetails = AndroidNotificationDetails('channel id', 'channel name', channelDescription: 'channel description', importance: Importance.max, priority: Priority.max, showWhen: false); 
      const NotificationDetails notificationDetails = NotificationDetails( android: androidNotificationDetails, iOS: DarwinNotificationDetails(badgeNumber: 1)); 
      await flutterLocalNotificationsPlugin.show(0, 'T상아리', '수사 기관은 개인정보를 요구하지 않습니다. \n 현재 수사기관 사칭 보이스 피싱이 의심됩니다.\n“제가 지금 배터리가 없어서요. 충전하고 OO경찰서 강력부로 전화드려서 형사님 바꿔달라 해도 될까요?” 라고 말해보세요.', notificationDetails);
  } 
} 