class ChinaTime {
  final String? timezone;
  final int? timezoneOffset;
  final int? timezoneOffsetWithDST;
  final String? date;
  final String? dateTime;
  final String? dateTimeTxt;
  final String? dateTimeWTI;
  final String? dateTimeYMD;
  final dynamic dateTimeUnix;
  final String? time24;
  final String? time12;
  final int? week;
  final int? month;
  final int? year;
  final String? yearAbbr;
  final bool? isDST;
  final int? dstSavings;

  ChinaTime({
    this.timezone,
    this.timezoneOffset,
    this.timezoneOffsetWithDST,
    this.date,
    this.dateTime,
    this.dateTimeTxt,
    this.dateTimeWTI,
    this.dateTimeYMD,
    this.dateTimeUnix,
    this.time24,
    this.time12,
    this.week,
    this.month,
    this.year,
    this.yearAbbr,
    this.isDST,
    this.dstSavings,
  });

  factory ChinaTime.fromJson(Map<String?, dynamic> json) {
    return ChinaTime(
      timezone: json['timezone'],
      timezoneOffset: json['timezone_offset'],
      timezoneOffsetWithDST: json['timezone_offset_with_dst'],
      date: json['date'],
      dateTime: json['date_time'],
      dateTimeTxt: json['date_time_txt'],
      dateTimeWTI: json['date_time_wti'],
      dateTimeYMD: json['date_time_ymd'],
      dateTimeUnix: json['date_time_unix'],
      time24: json['time_24'],
      time12: json['time_12'],
      week: json['week'],
      month: json['month'],
      year: json['year'],
      yearAbbr: json['year_abbr'],
      isDST: json['is_dst'],
      dstSavings: json['dst_savings'],
    );
  }
}
