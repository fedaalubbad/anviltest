
import '../core/class/statusrequest.dart';

handlingData(response) {

  if(response is StatusRequest){
    //problem connection
   return response;
  }else{
    //success get response
    return StatusRequest.success;
  }

}