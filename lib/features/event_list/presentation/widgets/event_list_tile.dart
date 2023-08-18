import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/util/date_formatter.dart';
import '../../data/entities/event.dart';

class EventListTile extends StatelessWidget {
  final Event event;
  final Function(String id) onTap;

  const EventListTile({super.key, required this.event, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: ListTile(
        onTap: () => onTap(event.id),
        tileColor: Colors.white,
        leading: SizedBox(
          height: 81,
          child: ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: AspectRatio(
                aspectRatio: 1,
                child: event.images.isNotEmpty
                    ? Image.network(
                        event.images[0].url,
                        fit: BoxFit.cover,
                      )
                    : SvgPicture.asset(
                        'assets/images/calendar.svg',
                      ),
              )),
        ),
        title: Text(
          event.name,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            fontFamily: 'Tiempos-Headline',
            fontSize: 17,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Row(
          children: [
            SvgPicture.asset(
              'assets/images/calendar.svg',
              width: 20,
              height: 20,
            ),
            Text(
                '${DateFormatter.formatDateString(event.sales.public.startDateTime)} - ${DateFormatter.formatDateString(event.sales.public.endDateTime)}'),
          ],
        ),
        trailing: SvgPicture.asset(
          'assets/images/heart.svg',
          width: 20,
          height: 20,
        ),
      ),
    );
  }
}
