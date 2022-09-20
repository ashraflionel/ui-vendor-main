extension InvertMap<K, V> on Map<K, V> {
  Map<V, K> get inverse => Map.fromEntries(entries.map((e) => MapEntry(e.value, e.key)));
}

Map<int, String> orderStatuses = {
  1: "New Order",
  13: "Delayed",
  4: "Preparing",
  11: "Ready",
  7: "Dispatched",
  3: "Declined",
  9: "Completed",
  10: "Cancelled",
};
