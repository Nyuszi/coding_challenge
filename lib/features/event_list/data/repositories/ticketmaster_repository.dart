import 'package:dio/dio.dart';

import '../../../../core/constants/server.dart';
import '../entities/event.dart';

class TicketmasterRepository {
  final Dio _dio = Dio();

  TicketmasterRepository();

  Future<List<Event>> fetchEvents(int pageNumber,
      {String searchKeyword = '', String searchClassificationName = ''}) async {
    try {
      final response = await _fetchEventData(
          pageNumber, searchKeyword, searchClassificationName);
      if (response.statusCode == 200) {
        final List<Event> events =
            _parseEvents(response.data['_embedded']['events']);

        if (searchKeyword.isNotEmpty) {
          return _filterEventsByKeyword(events, searchKeyword);
        } else {
          return events;
        }
      } else {
        throw Exception('Failed to fetch events');
      }
    } catch (error) {
      throw Exception('Failed to fetch events: $error');
    }
  }

  Future<Response> _fetchEventData(int pageNumber, String searchKeyword,
      String searchClassificationName) async {
    return await _dio.get(
      '${TICKETMASTER_URL}events.json?',
      queryParameters: {
        'apikey': API_KEY,
        'page': pageNumber,
        'keyword': searchKeyword,
        'classificationName': searchClassificationName
      },
    );
  }

  List<Event> _parseEvents(List<dynamic> eventsData) {
    final List<Event> events = [];
    for (dynamic eventData in eventsData) {
      if (eventData != null && eventData is Map<String, dynamic>) {
        try {
          Event event = Event.fromJson(eventData);
          events.add(event);
        } catch (e) {
          print('Error parsing event data: $e');
        }
      }
    }
    return events;
  }

  List<Event> _filterEventsByKeyword(List<Event> events, String searchKeyword) {
    return events
        .where((event) =>
            event.name.toLowerCase().contains(searchKeyword.toLowerCase()))
        .toList();
  }

  Future<List<String?>> fetchGenres() async {
    try {
      final response = await _dio.get(
        '${TICKETMASTER_URL}classifications/',
        queryParameters: {
          'apikey': API_KEY,
        },
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = response.data;
        List<dynamic>? classifications = data['_embedded']['classifications'];

        if (classifications != null) {
          List<String?> segmentNames = classifications
              .map((classification) {
                if (classification.containsKey('segment') &&
                    classification['segment'].containsKey('name')) {
                  return classification['segment']['name'].toString();
                } else {
                  return null;
                }
              })
              .where((name) => name != null)
              .toList();
          return segmentNames;
        } else {
          throw Exception('Classifications not found in the response');
        }
      } else {
        throw Exception('Failed to fetch classifications');
      }
    } catch (error) {
      throw Exception('Failed to fetch classifications: $error');
    }
  }
}
