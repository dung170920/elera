import 'package:elera/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Chips extends StatelessWidget {
  const Chips({super.key, required this.list, required this.selected});

  final List<Widget> list;
  final int selected;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 24.w),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Wrap(
          spacing: 12.w,
          runAlignment: WrapAlignment.start,
          children: list
              .map(
                (e) => ChoiceChip(
                  selectedColor: AppColors.primaryColor,
                  label: e,
                  selected: list.indexOf(e) == selected,
                  onSelected: (value) {},
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
