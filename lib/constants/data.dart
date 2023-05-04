import 'package:elera/models/models.dart';
import 'package:elera/screens/home/widgets/widgets.dart';
import 'package:elera/screens/screens.dart';
import 'package:elera/theme/theme.dart';
import 'package:elera/constants/constants.dart';
import 'package:flutter/widgets.dart';

class Data {
  Data._();

  static List<TextModel> getWelcomeList() {
    List<TextModel> list = [];
    list.add(
      TextModel(
        title: 'We provide the best learning courses & great mentors!',
        img: welcome1,
      ),
    );
    list.add(
      TextModel(
        title: 'Learn anytime and anywhere easily and conveniently',
        img: welcome2,
      ),
    );
    list.add(
      TextModel(
        title: "Let's improve your skills together with Elera right now!",
        img: welcome3,
      ),
    );
    return list;
  }

  static List<TextModel> getBottomBarItemList() {
    List<TextModel> list = [];
    list.add(
      TextModel(
        title: 'Home',
        iconData: MyIcons.home,
        activeIconData: MyIcons.solidHome,
      ),
    );
    list.add(
      TextModel(
        title: 'My Course',
        iconData: MyIcons.noteText,
        activeIconData: MyIcons.solidNoteText,
      ),
    );
    list.add(
      TextModel(
        title: "Inbox",
        iconData: MyIcons.chatDots,
        activeIconData: MyIcons.solidChatDots,
      ),
    );
    list.add(
      TextModel(
        title: "Transaction",
        iconData: MyIcons.shoppingCart,
        activeIconData: MyIcons.solidShoppingCart,
      ),
    );
    list.add(
      TextModel(
        title: "Profile",
        iconData: MyIcons.user,
        activeIconData: MyIcons.solidUser,
      ),
    );
    return list;
  }

  static Widget getPage(int index) {
    List<Widget> list = [
      HomeBody(),
      MyCourseScreen(),
      InboxScreen(),
      TransactionScreen(),
      ProfileScreen(),
    ];
    return list[index];
  }

  static List<TextModel> getThirdSignInList() {
    List<TextModel> list = [];
    list.add(
      TextModel(
        title: 'Continue with Facebook',
        img: fb,
      ),
    );
    list.add(
      TextModel(
        title: 'Continue with Google',
        img: google,
      ),
    );
    list.add(
      TextModel(
        title: "Continue with Apple",
        img: apple,
      ),
    );
    return list;
  }
}
