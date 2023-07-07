import 'package:elera/constants/constants.dart';
import 'package:magicon/magicon.dart';
import 'package:elera/theme/theme.dart';
import 'package:elera/utils/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommentCard extends StatelessWidget {
  const CommentCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _tapPosition;
    return Wrap(
      runSpacing: 12.w,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  width: 48.w,
                  height: 48.w,
                  decoration: BoxDecoration(
                    borderRadius: radiusCircular(100),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                        "https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80",
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 16.w,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Marielle Wigington',
                      style: AppTextStyle.bodyLarge(FontWeight.bold),
                    ),
                    SizedBox(
                      height: 4.w,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Wrap(
                          runSpacing: 4.w,
                          direction: Axis.horizontal,
                          children: List.generate(
                            5,
                            (index) => Icon(
                              Magicon.solidStar,
                              color: StatusType.WARNING.color,
                              size: 16.w,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 8.w,
                        ),
                        Text(
                          '2 weeks ago',
                          style: AppTextStyle.bodySmall(FontWeight.w600),
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
            GestureDetector(
              onTapDown: (details) => _tapPosition = details.globalPosition,
              onTap: () async {
                final RenderBox overlay =
                    Overlay.of(context).context.findRenderObject() as RenderBox;

                await showMenu(
                  context: context,
                  position: RelativeRect.fromRect(
                      _tapPosition &
                          Size(40, 40), // smaller rect, the touch area
                      Offset.zero &
                          overlay.size // Bigger rect, the entire screen
                      ),
                  items: [
                    PopupMenuItem(
                      onTap: () {},
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Magicon.flag,
                            size: 20.w,
                          ),
                          SizedBox(
                            width: 12.w,
                          ),
                          Text(
                            'Report',
                            style: AppTextStyle.bodyMedium(
                              FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
              child: Icon(
                Magicon.moreHorizontalCircle,
                size: 24.w,
              ),
            ),
          ],
        ),
        Text(
          'The course is very good, the explanation of the mentor is very clear and easy to understand!',
          style: AppTextStyle.bodyMedium(),
        ),
      ],
    );
  }
}
