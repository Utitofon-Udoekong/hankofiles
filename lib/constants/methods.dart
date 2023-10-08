DateTime getDateTimeFromISO8601String(String date) {
  return DateTime.parse(date);
}
DateTime? getNullableDateTimeFromISO8601String(String? date) {
  return date == null ? null : DateTime.parse(date);
}