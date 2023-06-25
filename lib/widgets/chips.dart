import 'package:elera/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Chips extends StatelessWidget {
  const Chips(
      {super.key, required this.list, required this.selected, this.onChange});

  final List<Widget> list;
  final int selected;
  final void Function(int)? onChange;

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
                  onSelected: (bool select) =>
                      select ? onChange!(list.indexOf(e)) : null,
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
