enum NotificationType { like, follow, comment }

const String dummyMaleImage = "https://t4.ftcdn.net/jpg/02/44/43/69/360_F_244436923_vkMe10KKKiw5bjhZeRDT05moxWcPpdmb.jpg";
String dummyFeMaleImage ="https://cdn1.vectorstock.com/i/thumb-large/46/55/person-gray-photo-placeholder-woman-vector-22964655.jpg";

String formatTimeofMillisecondsSinceEpoch(int millisecondsSinceEpoch) {
  DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(millisecondsSinceEpoch);
  DateTime now = DateTime.now();

  Duration difference = now.difference(dateTime);

  if (difference.inSeconds <= const Duration(hours: 2).inSeconds) {
    if (difference.inMinutes < 60) {
      return '${difference.inMinutes} minute${difference.inMinutes != 1 ? 's' : ''} ago';
    } else {
      return '${difference.inHours} hour${difference.inHours != 1 ? 's' : ''} ago';
    }
  } else if (difference.inDays >= 1 && difference.inDays < 7) {
    return '${difference.inDays} day${difference.inDays != 1 ? 's' : ''} ago';
  } else {
    return '${dateTime.day}/${dateTime.month}/${dateTime.year}';
  }
}