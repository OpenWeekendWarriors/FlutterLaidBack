// import 'package:queries/collections.dart';

// extension ListExtention<T> on List<T>{
//   Collection<T> get listCollection =>Collection(this);
//
// }

extension Iterables<E> on Iterable<E> {
  Map<K, List<E>> groupBy<K>(K Function(E) keyFunction) => fold(
      <K, List<E>>{},
          (Map<K, List<E>> map, E element) =>
      map..putIfAbsent(keyFunction(element), () => <E>[]).add(element));
}