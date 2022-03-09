import 'package:kids_puzzle/domain/core/model/number_model.dart';

extension SwappableList<E> on List<E> {
  // void swap(NumberModel first, NumberModel second) {
  //   final temp = this[first.idx!];
  //   this[first.idx!] = this[second.idx!];
  //   this[second.idx!] = temp;
  // }

  void swap(int index1, int index2) {
  RangeError.checkValidIndex(index1, this, 'index1');
  RangeError.checkValidIndex(index2, this, 'index2');
  var tmp = this[index1];
  this[index1] = this[index2];
  this[index2] = tmp;
}


}