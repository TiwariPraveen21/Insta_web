import 'package:info_web_app/globledata/global_value.dart';

class ApiNotification{
  NotificationType? type;
  String? id;
  String? time;
  String? message;
  String? sentById;
  String? sentToId;
  String? activityId;
  String? sentByImage;
  String? sentByName;
  String? sentByUsername;

  ApiNotification({this.type, this.message, this.activityId, this.sentById, this.sentByImage, this.sentByName, this.sentByUsername, this.sentToId, this.time, this.id});

  factory ApiNotification.fromJson({required Map<String, dynamic> json}){
    return ApiNotification(
        id: json['id'],
        type: json['type'],
        activityId: json['activityId'],
        time: json['time'],
        message: json['message'],
        sentById: json['sentById'],
        sentToId: json['sentToId'],
        sentByImage: json['sentByImage'],
        sentByName: json['sentByName'],
        sentByUsername: json['sentByUsername'],
    );
  }

  Map<String, dynamic> toMap(){
    return {
      'id':id,
      'type':type.toString(),
      'time':time,
      'activityId':activityId,
      'message':message,
      'sentById':sentById,
      'sentToId':sentToId,
      'sentByImage':sentByImage,
      'sentByName':sentByName,
      'sentByUsername':sentByUsername,
    };
  }
}



class NotificationList{
  List<String>? notificationIds;
  NotificationList({this.notificationIds});

  factory NotificationList.fromJson(Map<String, dynamic> json){
    return NotificationList(notificationIds: (json['notificationIds'] as List<dynamic>?)?.map((item) => item.toString()).toList());
  }

  Map<String, dynamic> toMap(){
    return {'notificationIds' : notificationIds};
  }
}