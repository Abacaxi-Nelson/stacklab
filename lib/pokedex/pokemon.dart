import 'package:equatable/equatable.dart';

class Pokemon extends Equatable {
  Pokemon({this.id, this.name, this.type, this.base});
  final int id;
  final Map<String, String> name;
  final List<String> type;
  final Map<String, int> base;

  @override
  List<Object> get props => [id, name, type, base];

  @override
  bool get stringify => true;

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    return Pokemon(
      id: json["id"],
      name: json["name"].cast<String, String>(),
      type: json["type"].cast<String>(),
      base: json["base"].cast<String, int>(),
    );
  }

  String getTitle() {
    return name['french'];
  }

  String getFormattedId() {
    return '#${id.toString().padLeft(3, '0')}';
  }
}
