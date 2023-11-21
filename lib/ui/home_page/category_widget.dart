import 'package:events_app/app_state.dart';
import 'package:events_app/model/category.dart';
import 'package:events_app/styleguide.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoryWidget extends StatelessWidget {
  final Category category;

  const CategoryWidget({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);
    final isSelected = appState.selectedCategoryID == category.categoryId;

    return GestureDetector(
      onTap: () {
        if (!isSelected) appState.updateCategoryID(category.categoryId);
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 8),
        height: 90,
        width: 90,
        decoration: BoxDecoration(
            border: Border.all(
                color: isSelected ? Colors.white : Color(0x99FFFFFF)),
            borderRadius: BorderRadius.circular(16),
            color: isSelected ? Colors.white : Colors.transparent),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(category.icon,
                color:
                    isSelected ? Theme.of(context).primaryColor : Colors.white,
                size: 40),
            SizedBox(height: 10),
            Text(category.name,
                style:
                    isSelected ? selectedCategoryTextStyle : categoryTextStyle),
          ],
        ),
      ),
    );
  }
}
