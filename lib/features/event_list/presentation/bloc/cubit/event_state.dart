import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../data/entities/event.dart';

part 'event_state.freezed.dart';

@freezed
abstract class EventState with _$EventState {
  const factory EventState.initial() = _Initial;
  const factory EventState.loading() = _Loading;
  const factory EventState.loaded(List<Event> events, bool hasReachedMax) = _Loaded;
  const factory EventState.error(String errorMessage) = _Error;
}
