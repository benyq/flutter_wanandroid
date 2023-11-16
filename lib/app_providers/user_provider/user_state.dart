import 'package:equatable/equatable.dart';

class UserState extends Equatable {
  final int id;
  final String username;
  final int coinCount;
  final List<int>? collectIds;

  const UserState(
      {this.id = -1, this.username = '', this.coinCount = -1, this.collectIds});

  bool get isLoggedIn => id != -1 && username.isNotEmpty;

  String get coin => coinCount >= 0 ? coinCount.toString() : '-';

  String get collects => collectIds?.length.toString() ?? '-';

  String get user => username.isNotEmpty ? username : '未登录';

  UserState copyWith(
      {int? id, String? username, int? coinCount, List<int>? collectIds}) {
    return UserState(
        id: id ?? this.id,
        username: username ?? this.username,
        coinCount: coinCount ?? this.coinCount,
        collectIds: collectIds ?? this.collectIds);
  }

  @override
  List<Object?> get props => [id, username, coinCount, collectIds];
}
