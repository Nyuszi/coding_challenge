import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class EventSearchBar extends StatelessWidget {
  final bool isPopupVisible;
  final Function onGenreToggle;
  final Function(String keyword) onSearchTap;
  final TextEditingController controller;

  const EventSearchBar(
      {Key? key,
      required this.isPopupVisible,
      required this.onGenreToggle,
      required this.onSearchTap, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      SearchBar(
        hintText: 'Search',
        controller: controller,
        leading: GestureDetector(
          onTap: () => onSearchTap(controller.text),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SvgPicture.asset(
              'assets/images/search_icon.svg',
              width: 20,
              height: 20,
            ),
          ),
        ),
        trailing: <Widget>[
          SizedBox(
            width: 150,
            child: GestureDetector(
              onTap: () {
                onGenreToggle();
              },
              child: Row(
                children: [
                  const Text('All Genres'),
                  isPopupVisible
                      ? const Icon(Icons.expand_less)
                      : const Icon(Icons.expand_more),
                ],
              ),
            ),
          ),
        ],
      ),
    ]);
  }
}
