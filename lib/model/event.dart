class Event {
  //Properties
  String objectId;
  String name;
  String description;
  String longDescription;
  String venue;
  String ec1Name;
  String ec1Phone;
  String ec2Name;
  String ec2Phone;
  int registration;
  String dateTime;

  //Constructors
  Event.fromMap({var map}) {
    objectId = map["objectId"];
    name = map["name"];
    description = map["oneLineDescription"];
    longDescription = map["fiveLineDescription"];
    venue = map["venue"];
    ec1Name = map["ec1Name"];
    ec1Phone = map["ec1Phone"];
    ec2Name = map["ec2Name"];
    ec2Phone = map["ec2Phone"];
    registration = map["registration"];
    dateTime = map["dateAndTime"];
  }
}
