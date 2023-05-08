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

  static List<CourseModel> getCourseList() {
    List<CourseModel> list = [];
    list.add(
      CourseModel(
        id: '1',
        img:
            'https://images.unsplash.com/photo-1611162617213-7d7a39e9b1d7?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80',
        name: '3D Design Illustration',
        price: 80,
        salePrice: 48,
        rate: 4.8,
        totalRate: 8289,
        type: '3D Design',
      ),
    );
    list.add(
      CourseModel(
        id: '2',
        img:
            'https://images.unsplash.com/photo-1499951360447-b19be8fe80f5?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80',
        name: 'Wordpress Website Design',
        price: 46,
        rate: 4.9,
        totalRate: 10298,
        type: 'Programming',
      ),
    );
    list.add(
      CourseModel(
        id: '3',
        img:
            'https://images.unsplash.com/photo-1512941937669-90a1b58e7e9c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80',
        name: 'Flutter Mobile Apps',
        price: 72,
        salePrice: 44,
        rate: 4.8,
        totalRate: 9928,
        type: 'Programming',
      ),
    );
    return list;
  }
}
