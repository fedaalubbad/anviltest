import 'dart:io';

  checkInternet() async {
    try {
      var result = await InternetAddress.lookup("google.com"); // check connection
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return true;
      }
    } on SocketException catch (_) {
      //happened if error happened
      return false; //no internet connection
    }
  }
