import 'package:collection/collection.dart';

/// `Runtime` генератор [hashCode], [==] и [toString]
mixin Comparer {
  /// Объекты для сравнения
  List<Object?> get objects;

  @override
  int get hashCode => Object.hashAll(objects);

  @override
  bool operator ==(Object other) =>
      (identical(this, other)) ||
      other is Comparer &&
          runtimeType == other.runtimeType &&
          _equals(other.objects, objects);

  @override
  String toString() =>
      '$runtimeType(${objects.map((Object? o) => o.toString()).join(', ')})';

  static const DeepCollectionEquality _equality = DeepCollectionEquality();

  /// Determines whether [list1] and [list2] are equal.
  bool _equals<T>(List<T>? list1, List<T>? list2) {
    if (identical(list1, list2)) return true;
    if (list1 == null || list2 == null) return false;
    final int length = list1.length;
    if (length != list2.length) return false;

    for (int i = 0; i < length; i++) {
      final dynamic unit1 = list1[i];
      final dynamic unit2 = list2[i];

      if (unit1 is Iterable || unit1 is Map) {
        if (!_equality.equals(unit1, unit2)) return false;
      } else if (unit1?.runtimeType != unit2?.runtimeType) {
        return false;
      } else if (unit1 != unit2) {
        return false;
      }
    }
    return true;
  }
}
