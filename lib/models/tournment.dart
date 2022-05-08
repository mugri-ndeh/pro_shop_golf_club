import 'package:pro_shop_golf_club/models/user.dart';

class Tournament {
  String id;
  List<UserModel> participants;
  UserModel? winner;
  String type;
  String teeingHole;
  String description;

  Tournament({
    required this.id,
    required this.participants,
    this.winner,
    required this.type,
    required this.teeingHole,
    required this.description,
  });
}
