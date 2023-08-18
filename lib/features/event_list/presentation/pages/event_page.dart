import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:very_good_infinite_list/very_good_infinite_list.dart';
import '../../../../core/routing/appRouter.gr.dart';
import '../bloc/cubit/event_cubit.dart';
import '../bloc/cubit/event_state.dart';
import '../widgets/event_list_tile.dart';
import '../widgets/event_search_bar.dart';
import '../widgets/genre_popup.dart';
import '../widgets/no_result_placeholder.dart';

@RoutePage()
class EventPage extends StatelessWidget {
  const EventPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () {
          if (context.read<EventCubit>().isPopupVisible) {
            context.read<EventCubit>().toggleGenrePopup();
          }
        },
        child: Scaffold(
          appBar: AppBar(
            title: const Text(
              'Events',
              style: TextStyle(
                fontFamily: 'Tiempos-Headline',
                fontSize: 36,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          body: BlocBuilder<EventCubit, EventState>(
            builder: (context, state) {
              return Stack(
                children: [
                  Column(
                    children: [
                      EventSearchBar(
                        isPopupVisible:
                            context.read<EventCubit>().isPopupVisible,
                        onGenreToggle:
                            context.read<EventCubit>().toggleGenrePopup,
                        onSearchTap: (keyword) => context
                            .read<EventCubit>()
                            .updateSearchText(keyword),
                        controller: context.read<EventCubit>().searchController,
                      ),
                      Flexible(
                        fit: FlexFit.loose,
                        child: InfiniteList(
                          itemCount:
                              context.read<EventCubit>().loadedEvents.length,
                          onFetchData: () =>
                              context.read<EventCubit>().fetchEvents(),
                          isLoading: context.read<EventCubit>().loading,
                          itemBuilder: (context, index) {
                            final event =
                                context.read<EventCubit>().loadedEvents[index];
                            return EventListTile(
                              event: event,
                              onTap: (String id) {
                                AutoRouter.of(context).push(
                                  DetailedRoute(id: id),
                                );
                              },
                            );
                          },
                          loadingBuilder: (context) =>
                              const Center(child: CircularProgressIndicator()),
                          errorBuilder: (context) =>
                              const Center(child: NoResultPlaceholder()),
                        ),
                      ),
                    ],
                  ),
                  if (context.read<EventCubit>().isPopupVisible)
                    Positioned(
                      top: 50,
                      right: 0,
                      child: GenrePopup(
                        genreOptions: context.read<EventCubit>().loadedGenres,
                        selectedGenres:
                            context.read<EventCubit>().selectedGenres,
                        onGenreToggle:
                            context.read<EventCubit>().toggleGenreSelection,
                      ),
                    ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
