// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Event _$EventFromJson(Map<String, dynamic> json) => Event(
      name: json['name'] as String,
      type: json['type'] as String,
      id: json['id'] as String,
      url: json['url'] as String,
      images: (json['images'] as List<dynamic>)
          .map((e) => ImageData.fromJson(e as Map<String, dynamic>))
          .toList(),
      sales: Sales.fromJson(json['sales'] as Map<String, dynamic>),
      dates: Dates.fromJson(json['dates'] as Map<String, dynamic>),
      classifications: (json['classifications'] as List<dynamic>)
          .map((e) => Classification.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$EventToJson(Event instance) => <String, dynamic>{
      'name': instance.name,
      'type': instance.type,
      'id': instance.id,
      'url': instance.url,
      'images': instance.images,
      'sales': instance.sales,
      'dates': instance.dates,
      'classifications': instance.classifications,
    };

ImageData _$ImageDataFromJson(Map<String, dynamic> json) => ImageData(
      url: json['url'] as String,
    );

Map<String, dynamic> _$ImageDataToJson(ImageData instance) => <String, dynamic>{
      'url': instance.url,
    };

Sales _$SalesFromJson(Map<String, dynamic> json) => Sales(
      public: PublicSales.fromJson(json['public'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SalesToJson(Sales instance) => <String, dynamic>{
      'public': instance.public,
    };

PublicSales _$PublicSalesFromJson(Map<String, dynamic> json) => PublicSales(
      startDateTime: json['startDateTime'] as String,
      endDateTime: json['endDateTime'] as String,
    );

Map<String, dynamic> _$PublicSalesToJson(PublicSales instance) =>
    <String, dynamic>{
      'startDateTime': instance.startDateTime,
      'endDateTime': instance.endDateTime,
    };

Dates _$DatesFromJson(Map<String, dynamic> json) => Dates(
      start: Start.fromJson(json['start'] as Map<String, dynamic>),
      timezone: json['timezone'] as String,
    );

Map<String, dynamic> _$DatesToJson(Dates instance) => <String, dynamic>{
      'start': instance.start,
      'timezone': instance.timezone,
    };

Start _$StartFromJson(Map<String, dynamic> json) => Start(
      localDate: json['localDate'] as String,
      localTime: json['localTime'] as String,
      dateTime: json['dateTime'] as String,
    );

Map<String, dynamic> _$StartToJson(Start instance) => <String, dynamic>{
      'localDate': instance.localDate,
      'localTime': instance.localTime,
      'dateTime': instance.dateTime,
    };

Classification _$ClassificationFromJson(Map<String, dynamic> json) =>
    Classification(
      primary: json['primary'] as bool,
      genre: Genre.fromJson(json['genre'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ClassificationToJson(Classification instance) =>
    <String, dynamic>{
      'primary': instance.primary,
      'genre': instance.genre,
    };

Genre _$GenreFromJson(Map<String, dynamic> json) => Genre(
      name: json['name'] as String,
    );

Map<String, dynamic> _$GenreToJson(Genre instance) => <String, dynamic>{
      'name': instance.name,
    };
