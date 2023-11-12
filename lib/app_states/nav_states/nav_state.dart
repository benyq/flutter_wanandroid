import 'package:equatable/equatable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NavState extends Equatable {
  const NavState({this.index = 0});

  final int index;

  NavState copyWith({int? index}) {
    return NavState(index: index?? this.index);
  }

  @override
  List<Object?> get props => [index];
}


