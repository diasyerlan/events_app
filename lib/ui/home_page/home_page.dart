import 'package:events_app/app_state.dart';
import 'package:events_app/model/category.dart';
import 'package:events_app/model/event.dart';
import 'package:events_app/styleguide.dart';
import 'package:events_app/ui/event_details/event_details.dart';
import 'package:events_app/ui/home_page/category_widget.dart';
import 'package:events_app/ui/home_page/event_widget.dart';
import 'package:events_app/ui/home_page/home_page_background.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ChangeNotifierProvider(
      create: (_) => AppState(),
      child: Stack(
        children: [
          HomePageBackground(screenHeight: MediaQuery.of(context).size.height),
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 56),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: Row(
                    children: [
                      Text(
                        'LOCAL EVENTS',
                        style: fadedTextStyle,
                      ),
                      Spacer(),
                      Icon(
                        Icons.person_outline,
                        color: Color(0x99FFFFFF),
                        size: 30,
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 32),
                  child: Text(
                    "What's up?",
                    style: whiteHeadingTextStyle,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 24),
                  child: Consumer<AppState>(
                    builder: (context, appState, _) => SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          for (final category in categories)
                            CategoryWidget(category: category)
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Consumer<AppState>(
                    builder: (context, appState, _) => Column(
                      children: [
                        for (final event in events.where((e) => e.categoryIds
                            .contains(appState.selectedCategoryID)))
                          GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) =>
                                        EventDetailsPage(event: event)));
                              },
                              child: EventWidget(event: event))
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    ));
  }
}
