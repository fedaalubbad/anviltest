import 'dart:convert';
import 'dart:io';
import 'package:anviltest/core/class/statusrequest.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

import '../../functions/checkinternet.dart';

class Crud {
  Future<Either<StatusRequest, Map>> postData(String url, Map data) async {
    //either return two type of return
    try {
      if (await checkInternet()) {
        var response = await http.post(Uri.parse(url), body: data);
        if (response.statusCode == 200 || response.statusCode == 201) {
          Map responseBody = jsonDecode(response.body);
          return  Right(responseBody); //return right type of return
        } else {
          return const Left(StatusRequest.serverFailure);
        }
      } else {
        return const Left(
            StatusRequest.offlineFailure); //return left type of return
      }
    }catch(e){
      print(e);
      return const Left(StatusRequest.serverException);
    }
  }
  Future<Either<StatusRequest, dynamic>> getData(String url) async {
    print(url);
    //either return two type of return
    try {
      if (await checkInternet()) {
        var response = await http.get(
            Uri.parse(url));
        if (response.statusCode == 200 || response.statusCode == 201) {
          var responseBody = (json.decode(utf8.decode(response.bodyBytes)));
          return Right(responseBody); //return right type of return
        } else if (response.statusCode == 400 || response.statusCode == 404 ||
            response.statusCode == 401) {
          var responseBody = (json.decode(utf8.decode(response.bodyBytes)));
          return Right(responseBody);
        } else {
          return const Left(StatusRequest.serverFailure);
        }
      } else {
        return const Left(
            StatusRequest.offlineFailure); //return left type of return
      }
    } catch (_) {
      return const Left(StatusRequest.serverException);
    }
  }

  // Future getData() async {}
}

