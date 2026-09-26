import 'package:hive_flutter/hive_flutter.dart';

part 'user_model.g.dart';

@HiveType(typeId: 0)
class UserModel extends HiveObject {
  @HiveField(0)
  String name;
  @HiveField(1)
  String image;
  UserModel({required this.image, required this.name});
}
