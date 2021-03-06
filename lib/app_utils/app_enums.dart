enum SortingTag { expHighToLow, expLowToHigh, priceHighToLow, priceLowToHigh }

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> _reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    _reverseMap ??= map.map(
      (k, v) => MapEntry(v, k),
    );

    return _reverseMap;
  }
}
