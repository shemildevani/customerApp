String getEventStatus(String? start, String? end) {
  try {
    if (start == null || end == null) return 'N/A';

    final startDate = DateTime.tryParse(start);
    final endDate = DateTime.tryParse(end);
    final now = DateTime.now().toUtc();

    if (startDate == null || endDate == null) return 'N/A';

    if (now.isBefore(startDate)) {
      return 'Upcoming';
    } else if (now.isAfter(endDate)) {
      return 'Completed';
    } else {
      return 'Active';
    }
  } on Exception catch (_) {
    return 'N/A';
  }
}

bool isRegisterAllowed(String? start, String? end) {
  try {
    if (start == null || end == null) return false;

    final startDate = DateTime.tryParse(start);
    final endDate = DateTime.tryParse(end);
    final now = DateTime.now().toUtc();

    if (startDate == null || endDate == null) return false;

    return now.isBefore(endDate);
  } on Exception catch (_) {
    return false;
  }
}
