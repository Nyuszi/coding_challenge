import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/entities/event.dart';
import '../../../data/repositories/ticketmaster_repository.dart';
import 'event_state.dart';

class EventCubit extends Cubit<EventState> {
  final TicketmasterRepository repository;
  List<Event> loadedEvents = [];
  List<String?> loadedGenres = [];
  int _pageNumber = 1;
  bool hasReachedMax = false;
  bool loading = false;
  bool isPopupVisible = false;
  List<String?> selectedGenres = [];
  int i = 0;
  TextEditingController searchController = TextEditingController();
  String currentSearchKeyword = '';
  String currentSearchClassification = '';

  EventCubit({required this.repository}) : super(const EventState.initial());

  Future<void> fetchEvents(
      {String searchKeyword = '', String searchClassificationName = ''}) async {
    if (hasReachedMax) return;

    emit(const EventState.loading());
    loading = true;
    if (searchClassificationName != '') {
      searchClassificationName = "[$searchClassificationName]";
    }
    try {
      loadedGenres = await repository.fetchGenres();

      final events = await repository.fetchEvents(_pageNumber,
          searchKeyword: searchKeyword,
          searchClassificationName: searchClassificationName);
      loadedEvents.addAll(events);
      if (events.isEmpty) {
        hasReachedMax = true;
      }
      _pageNumber++;
      emit(EventState.loaded(loadedEvents, hasReachedMax));
      loading = false;
    } catch (error) {
      emit(const EventState.error('Failed to fetch events'));
      loading = false;
    }
  }

  void searchEvents({
    String searchKeyword = '',
    String searchClassificationName = '',
  }) {
    _pageNumber = 1;
    hasReachedMax = false;
    loadedEvents = [];
    fetchEvents(
      searchKeyword: searchKeyword,
      searchClassificationName: searchClassificationName,
    );
  }

  void toggleGenrePopup() {
    emit(const EventState.loading());
    isPopupVisible = !isPopupVisible;
    emit(EventState.loaded(loadedEvents, hasReachedMax));
  }

  void toggleGenreSelection(String? genre) {
    emit(const EventState.loading());
    if (genre == null) {
      selectedGenres.clear();
    } else {
      if (selectedGenres.contains(genre)) {
        selectedGenres.remove(genre);
      } else {
        selectedGenres.add(genre);
      }
    }
    updateSearchCategory(genre);
  }

  void updateSearchText(String newSearchText) {
    currentSearchKeyword = newSearchText;
    searchEvents(
      searchKeyword: newSearchText,
      searchClassificationName: selectedGenres.isNotEmpty
          ? selectedGenres.join(",")
          : currentSearchClassification,
    );
  }

  void updateSearchCategory(String? newCategory) {
    if (newCategory == null) {
      searchEvents(searchKeyword: currentSearchKeyword);
    } else {
      currentSearchClassification = newCategory;
      searchEvents(
        searchKeyword: currentSearchKeyword,
        searchClassificationName:
            selectedGenres.isNotEmpty ? selectedGenres.join(",") : newCategory,
      );
    }
  }
}
