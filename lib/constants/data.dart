import 'package:elera/models/models.dart';
import 'package:elera/routes/routes.dart';
import 'package:elera/screens/home/widgets/widgets.dart';
import 'package:elera/screens/screens.dart';
import 'package:elera/constants/constants.dart';
import 'package:flutter/widgets.dart';
import 'package:magicon/magicon.dart';

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
        iconData: Magicon.home,
        activeIconData: Magicon.solidHome,
      ),
    );
    list.add(
      TextModel(
        title: 'My Courses',
        iconData: Magicon.noteText,
        activeIconData: Magicon.solidNoteText,
      ),
    );
    list.add(
      TextModel(
        title: "Inbox",
        iconData: Magicon.chatDots,
        activeIconData: Magicon.solidChatDots,
      ),
    );
    list.add(
      TextModel(
        title: "Transaction",
        iconData: Magicon.shoppingCart,
        activeIconData: Magicon.solidShoppingCart,
      ),
    );
    list.add(
      TextModel(
        title: "Profile",
        iconData: Magicon.user,
        activeIconData: Magicon.solidUser,
      ),
    );
    return list;
  }

  static Widget getPage(int index) {
    List<Widget> list = [
      HomeBody(),
      MyCoursesScreen(),
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

  static List<UserModel> getMentorList() {
    List<UserModel> list = [];
    list.add(
      UserModel(
        id: '1',
        avatar:
            'https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80',
        name: 'Claire Ordonez',
      ),
    );
    list.add(
      UserModel(
        id: '2',
        avatar:
            'https://images.unsplash.com/photo-1599566150163-29194dcaad36?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80',
        name: 'Jacob Kulikowski',
      ),
    );
    list.add(
      UserModel(
        id: '3',
        avatar:
            'https://images.unsplash.com/photo-1580489944761-15a19d654956?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=461&q=80',
        name: 'Priscilla Ehrman',
      ),
    );
    list.add(
      UserModel(
        id: '4',
        avatar:
            'https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=580&q=80',
        name: 'Wade Chenail',
      ),
    );
    list.add(
      UserModel(
        id: '5',
        avatar:
            'https://images.unsplash.com/photo-1633332755192-727a05c4013d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=580&q=80',
        name: 'Benny Spanbauer',
      ),
    );
    return list;
  }

  static List<TextModel> getProfileActionList() {
    List<TextModel> list = [];
    list.add(
      TextModel(
        title: 'Profile',
        iconData: Magicon.user,
        path: AppRoutes.INFO_EDIT,
      ),
    );
    list.add(
      TextModel(
        title: 'Notification',
        iconData: Magicon.bell,
        path: AppRoutes.INFO_EDIT,
      ),
    );
    list.add(
      TextModel(
        title: "Payment",
        iconData: Magicon.wallet,
        path: AppRoutes.INFO_EDIT,
      ),
    );
    list.add(
      TextModel(
        title: "Security",
        iconData: Magicon.shieldCheck,
        path: AppRoutes.INFO_EDIT,
      ),
    );
    list.add(
      TextModel(
        title: "Language",
        iconData: Magicon.globe,
        path: AppRoutes.INFO_EDIT,
      ),
    );
    list.add(
      TextModel(
        title: "Dark Mode",
        iconData: Magicon.brushAlt,
        path: AppRoutes.INFO_EDIT,
      ),
    );
    list.add(
      TextModel(
        title: "Privacy Policy",
        iconData: Magicon.lock,
        path: AppRoutes.INFO_EDIT,
      ),
    );
    list.add(
      TextModel(
        title: "Help Center",
        iconData: Magicon.commentQuestion,
        path: AppRoutes.INFO_EDIT,
      ),
    );
    // list.add(
    //   TextModel(
    //     title: "Invite Friends",
    //     iconData: Magicon.usersGroup,
    //   ),
    // );
    return list;
  }
}
