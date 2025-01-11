import 'package:bottom_navigation_bar/size_config.dart';

double animatedPositedLeftValue(int correctIndex) {
  switch (correctIndex) {
    case 0:
      return AppSize.blockSizeHorizontal * 6.5;
    case 1:
      return AppSize.blockSizeHorizontal * 29.8;
    case 2:
      return AppSize.blockSizeHorizontal * 52.9;
    case 3:
      return AppSize.blockSizeHorizontal * 76.1;
    default:
      return 0.0;
  }
}

// double animatedPositedBottomValue(int correctIndex) {
//   switch (correctIndex) {
//     case 0:
//       return AppSize.blockSizeVertical * 5.5;
//     case 1:
//       return AppSize.blockSizeVertical = 0;
//     case 2:
//       return AppSize.blockSizeVertical * 5.5;
//     case 3:
//       return AppSize.blockSizeVertical = 0; // example value
//     default:
//       return 0.0; // default value
//   }
// }
