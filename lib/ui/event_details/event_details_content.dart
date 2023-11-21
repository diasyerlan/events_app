import 'package:events_app/model/guest.dart';
import 'package:events_app/styleguide.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../model/event.dart';

class EventDetailsContent extends StatelessWidget {
  const EventDetailsContent({super.key});

  @override
  Widget build(BuildContext context) {
    final event = Provider.of<Event>(context);
    final screenWidth = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        SizedBox(height: 90),
        Padding(
          padding: EdgeInsets.only(
              left: screenWidth * 0.25, right: screenWidth * 0.15),
          child: Text(
            event.title,
            style: eventWhiteTitleTextStyle.copyWith(height: 1.1),
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Padding(
          padding: EdgeInsets.only(left: screenWidth * 0.25),
          child: Row(
            children: [
              Icon(
                Icons.location_on,
                color: Colors.white,
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                event.location,
                style: eventLocationTextStyle.copyWith(
                    color: Colors.white, fontWeight: FontWeight.w300),
              ),
            ],
          ),
        ),
        SizedBox(height: 80),
        Padding(
          padding: EdgeInsets.only(left: 16),
          child: Text(
            'GUESTS',
            style: guestTextStyle,
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              for (final guest in guests)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipOval(
                    child: Image.asset(
                      guest.imagePath,
                      fit: BoxFit.cover,
                      width: 90,
                      height: 90,
                    ),
                  ),
                )
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.all(16),
          child: RichText(
              text: TextSpan(children: [
            TextSpan(text: event.punchLine1, style: punchLine1TextStyle),
            TextSpan(text: event.punchLine2, style: punchLine2TextStyle)
          ])),
        ),
        if (event.description.isNotEmpty)
          Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              event.description,
              style: eventLocationTextStyle,
            ),
          ),
        if (event.galleryImages.isNotEmpty)
          Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              'GALLERY',
              style: guestTextStyle,
            ),
          ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              for (final galleryImage in event.galleryImages)
                Container(
                  margin: EdgeInsets.only(left: 16, right: 16, bottom: 32),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      galleryImage,
                      fit: BoxFit.cover,
                      width: 180,
                      height: 180,
                    ),
                  ),
                )
            ],
          ),
        ),
      ]),
    );
  }
}
