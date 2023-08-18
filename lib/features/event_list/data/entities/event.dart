import 'package:json_annotation/json_annotation.dart';

part 'event.g.dart';

@JsonSerializable()
class Event {
  Event({
    required this.name,
    required this.type,
    required this.id,
    required this.url,
    required this.images,
    required this.sales,
    required this.dates,
    required this.classifications,
  });

  factory Event.fromJson(Map<String, dynamic> json) =>
      _$EventFromJson(json);

  final String name;
  final String type;
  final String id;
  final String url;
  final List<ImageData> images;
  final Sales sales;
  final Dates dates;
  final List<Classification> classifications;
}

@JsonSerializable()
class ImageData {
  ImageData({
    required this.url,
  });

  factory ImageData.fromJson(Map<String, dynamic> json) =>
      _$ImageDataFromJson(json);

  final String url;
}

@JsonSerializable()
class Sales {
  Sales({
    required this.public,
  });

  factory Sales.fromJson(Map<String, dynamic> json) => _$SalesFromJson(json);

  final PublicSales public;
}

@JsonSerializable()
class PublicSales {
  PublicSales({
    required this.startDateTime,
    required this.endDateTime,
  });

  factory PublicSales.fromJson(Map<String, dynamic> json) =>
      _$PublicSalesFromJson(json);

  final String startDateTime;
  final String endDateTime;
}

@JsonSerializable()
class Dates {
  Dates({
    required this.start,
    required this.timezone,
  });

  factory Dates.fromJson(Map<String, dynamic> json) => _$DatesFromJson(json);

  final Start start;
  final String timezone;
}

@JsonSerializable()
class Start {
  Start({
    required this.localDate,
    required this.localTime,
    required this.dateTime,
  });

  factory Start.fromJson(Map<String, dynamic> json) => _$StartFromJson(json);

  final String localDate;
  final String localTime;
  final String dateTime;
}

@JsonSerializable()
class Classification {
  Classification({
    required this.primary,
    required this.genre,
  });

  factory Classification.fromJson(Map<String, dynamic> json) =>
      _$ClassificationFromJson(json);

  final bool primary;
  final Genre genre;
}

@JsonSerializable()
class Genre {
  Genre({
    required this.name,
  });

  factory Genre.fromJson(Map<String, dynamic> json) => _$GenreFromJson(json);

  final String name;
}

// Add more classes for the remaining structures if needed
