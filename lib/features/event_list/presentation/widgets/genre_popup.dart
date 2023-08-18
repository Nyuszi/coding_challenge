import 'package:flutter/material.dart';

class GenrePopup extends StatelessWidget {
  final List<String?> genreOptions;
  final List<String?> selectedGenres;
  final ValueChanged<String?> onGenreToggle;

  const GenrePopup({super.key, 
    required this.genreOptions,
    required this.selectedGenres,
    required this.onGenreToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 5.0)],
      ),
      child: Column(
        children: [
          const Text(
            "Filter by Genre",
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey,
            ),
          ),
          ListTile(
            title: const Text("All Genres"),
            leading: Checkbox(
              value: selectedGenres.isEmpty,
              onChanged: (bool? value) {
                onGenreToggle(null);
              },
            ),
          ),
          for (String? genre in genreOptions)
            ListTile(
              title: Text(genre ?? 'Unknown'),
              leading: Checkbox(
                value: selectedGenres.contains(genre),
                onChanged: (bool? value) {
                  onGenreToggle(genre);
                },
              ),
            ),
        ],
      ),
    );
  }
}
