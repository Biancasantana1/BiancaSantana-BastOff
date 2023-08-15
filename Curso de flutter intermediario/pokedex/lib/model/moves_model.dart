import 'move_model.dart';

class Moves {
  Moves({
    required this.move,
  });
  late final Move move;

  Moves.fromJson(Map<String, dynamic> json) {
    move = Move.fromJson(json['move']);
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['move'] = move.toJson();
    return data;
  }
}
