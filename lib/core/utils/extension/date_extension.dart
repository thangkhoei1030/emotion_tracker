extension DateTimeEtx on DateTime {
  DateTime formatOnlyDMY() {
    return DateTime(year, month, day);
  }

  bool isAtSameMomentAs2(DateTime time) {
    return formatOnlyDMY().isAtSameMomentAs(time.formatOnlyDMY());
  }
}
