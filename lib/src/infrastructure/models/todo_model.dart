import 'package:cloud_firestore/cloud_firestore.dart';

class TodoModel {
  String? title;
  String? todoId;
  Timestamp? dateCreated;
  Timestamp? dateDeadline;
  bool? isDone;
  int? lat;
  int? long;
  int? notificationId;

  TodoModel(
      {this.title,
      this.todoId,
      this.dateDeadline,
      this.dateCreated,
      this.isDone,
      this.lat,
      this.long,
      this.notificationId});

  TodoModel.fromDocumentSnapshot({
    required QueryDocumentSnapshot documentSnapshot,
  }) {
    todoId = documentSnapshot.id;
    title = documentSnapshot["content"];
    dateCreated = documentSnapshot["dateCreated"];
    dateDeadline = documentSnapshot["dateDeadline"];
    isDone = documentSnapshot["isDone"];
    lat = documentSnapshot["lat"];
    long = documentSnapshot["long"];
    notificationId = documentSnapshot["notificationId"];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['content'] = title;
    data['dateCreated'] = dateCreated;
    data['dateDeadline'] = dateDeadline;
    data['isDone'] = isDone;
    data['lat'] = lat;
    data['long'] = long;
    data['notificationId'] = notificationId;
    return data;
  }
}
