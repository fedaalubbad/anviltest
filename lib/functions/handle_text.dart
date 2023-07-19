String handleText(String text){
  return text.length>35 ?
      text.substring(0,35)+'...':text;
}