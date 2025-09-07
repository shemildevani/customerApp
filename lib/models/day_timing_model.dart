class DayTiming {
  final String day;
  final String openTime;
  final String closeTime;
  final bool isClosed;
  DayTiming({
    required this.day,
    required this.openTime,
    required this.closeTime,
    this.isClosed = false,
  });

  factory DayTiming.fromJson(Map<String, dynamic> json) {
    return DayTiming(
      day: json['day'],
      openTime: json['openTime'],
      closeTime: json['closeTime'],
      isClosed: json['isClosed'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'day': day,
      'openTime': openTime,
      'closeTime': closeTime,
      'isClosed': isClosed,
    };
  }
}

class BusinessWeekTiming {
  final List<DayTiming> timings;

  BusinessWeekTiming({required this.timings});

  factory BusinessWeekTiming.fromJson(List<dynamic> json) {
    return BusinessWeekTiming(
      timings: json.map((e) => DayTiming.fromJson(e)).toList(),
    );
  }

  List<Map<String, dynamic>> toJson() {
    return timings.map((e) => e.toJson()).toList();
  }
}
