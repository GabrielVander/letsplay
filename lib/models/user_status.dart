import 'package:flutter/cupertino.dart';

enum UserStatus { ONLINE, OFFLINE, PLAYING, UNKNOWN }

extension UserStatusExtension on UserStatus {
  Color get color {
    switch (this) {
      case UserStatus.ONLINE:
        return Color(0xff0bff33);
      case UserStatus.OFFLINE:
        return Color(0xff2e366d);
      case UserStatus.PLAYING:
        return Color(0xff0dd1ff);
      default:
        return Color(0xff000000);
    }
  }
}

class UserStatusHelper {

  static UserStatus getFromString(String string) {
    switch (string) {
      case 'online':
        return UserStatus.ONLINE;
      case 'offline':
        return UserStatus.OFFLINE;
      case 'playing':
        return UserStatus.PLAYING;
      default:
        return UserStatus.UNKNOWN;
    }
  }

}
