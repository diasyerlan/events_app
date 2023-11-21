import 'package:events_app/model/event.dart';
import 'package:events_app/ui/event_details/event_details_background.dart';
import 'package:events_app/ui/event_details/event_details_content.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EventDetailsPage extends StatelessWidget {
  final Event event;
  const EventDetailsPage({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Provider.value(
      value: event,
      child: Stack(children: [
        EventDetailsBackground(),
        EventDetailsContent(),
      ]),
    ));
  }
}
