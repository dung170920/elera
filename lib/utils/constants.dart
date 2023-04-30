import 'package:elera/models/models.dart';
import 'package:elera/utils/utils.dart';

const defaultRadius = 16.0;
const defaultSmallRadius = 8.0;

List<TextModel> getWelcomeList() {
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

List<TextModel> getThirdSignInList() {
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
