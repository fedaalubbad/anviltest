enum StatusRequest {
  none,
  loading,
  success,
  failure, // php failed
  serverFailure, //server error
  offlineFailure, //network connection error
  serverException, //network connection error
}
