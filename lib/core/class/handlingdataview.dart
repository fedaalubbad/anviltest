//
// import 'package:anviltest/core/class/statusrequest.dart';
// import 'package:flutter/material.dart';
//
// class HandlingDataView extends StatelessWidget{
//   final StatusRequest statusRequest;
//   final Widget widget;
//   const HandlingDataView({super.key, required this.statusRequest, required this.widget});
//
//   @override
//   Widget build(BuildContext context) {
//    return
//     statusRequest==StatusRequest.loading?
//     Center(child:Text('loading'),width: 250,height: 250)):
//     statusRequest==StatusRequest.offlineFailure?
//     Center(child:Lottie.asset(AppImageAsset.offlineFailure,width: 250,height: 250)):
//     statusRequest==StatusRequest.serverFailure?
//     Center(child:Lottie.asset(AppImageAsset.serverfailure,width: 250,height: 250,repeat: false)):
//     statusRequest==StatusRequest.serverException?
//     Center(child:Lottie.asset(AppImageAsset.serverfailure,width: 250,height: 250,repeat: false)):
//     statusRequest==StatusRequest.failure?
//     Center(child:Lottie.asset(AppImageAsset.failurenoresult,width: 250,height: 250))
//      :widget; // if success
//
//   }
//
// }
// class HandlingDataRequest extends StatelessWidget{
//   final StatusRequest statusRequest;
//   final Widget widget;
//   const HandlingDataRequest({super.key, required this.statusRequest, required this.widget});
//
//   @override
//   Widget build(BuildContext context) {
//     return
//       statusRequest==StatusRequest.loading?
//       Center(child:Lottie.asset(AppImageAsset.loading,width: 250,height: 250)):
//       statusRequest==StatusRequest.offlineFailure?
//       Center(child:Lottie.asset(AppImageAsset.offlineFailure,width: 250,height: 250)):
//       statusRequest==StatusRequest.serverFailure?
//       Center(child:Lottie.asset(AppImageAsset.serverfailure,width: 250,height: 250,repeat: false))
//           :widget; // if success
//
//   }
//
// }