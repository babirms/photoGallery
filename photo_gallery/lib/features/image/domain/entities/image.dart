import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class Image extends Equatable {
  final String path;

  Image({@required this.path});

  @override
  List<Object> get props => [path];

}