import 'package:flutter_technical_task/core/theming/app_colors.dart';
import 'package:fluttertoast/fluttertoast.dart';

showToast({
  String? message,
})async{
  await Fluttertoast.cancel();
  Fluttertoast.showToast(
    msg: message??'',
      toastLength: Toast.LENGTH_LONG,
     fontSize: 16,
      textColor: AppColors.white,
     gravity: ToastGravity.CENTER,
    backgroundColor: AppColors.primaryPurple600,
  );
}
