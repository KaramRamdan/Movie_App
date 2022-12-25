import 'package:equatable/equatable.dart';

class Recommendation extends Equatable {
  final String? backdropPath;
  final String? title;
  final int id;


  const Recommendation({
    this.backdropPath,
    this.title,
    required this.id,

  });

  @override
  List<Object?> get props => [backdropPath, id,title];
}