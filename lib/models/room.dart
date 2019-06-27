import 'type.dart';
import 'value.dart';

class Room {
  double width;
  double height;
  double length;
  String type;
  static Room _instance;

  factory Room() {
    _instance ??= Room._internalConstructor(0, 0, 0, "");
    return _instance;
  }

  Room._internalConstructor(
    this.width,
    this.height,
    this.length,
    this.type,
  );

  int getBtuBy2D() {
    var result = (width * height) * mapType(type);
    return result.toInt();
  }

  int getBtuBy3D() {
    final result = ((width * height * length) * mapType(type)) / 3;
    return result.toInt();
  }

  int mapType(String type) {
    switch (type) {
      case RoomType.Room1:
        return RoomValue.Room1;
      case RoomType.Room2:
        return RoomValue.Room2;
      case RoomType.Room3:
        return RoomValue.Room3;
      case RoomType.Room4:
        return RoomValue.Room4;
      case RoomType.Room5:
        return RoomValue.Room5;
      case RoomType.Room6:
        return RoomValue.Room6;
      default:
        return 0;
    }
  }

  static List<String> getTypes() {
    return <String>[
      RoomType.Room1,
      RoomType.Room2,
      RoomType.Room3,
      RoomType.Room4,
      RoomType.Room5,
      RoomType.Room6
    ];
  }
}
