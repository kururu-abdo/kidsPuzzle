import 'package:equatable/equatable.dart';

class NumberModel extends Equatable {
   int? number;
  int? idx;

  NumberModel({this.number, this.idx});

  @override
  // TODO: implement props
  List<Object?> get props => [idx ,number];
  
}