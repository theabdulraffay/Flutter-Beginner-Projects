/// userId : 1
/// id : 1
/// title : "sunt aut facere repellat provident occaecati excepturi optio reprehenderit"
/// body : "quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto"

class Model {
  Model({
    num? userId,
    num? id,
    String? title,
    String? body,
  }) {
    UserID = userId;
    ID = id;
    titleBody = title;
    paragraph = body;
  }

  Model.fromJson(dynamic json) {
    UserID = json['userId'];
    ID = json['id'];
    titleBody = json['title'];
    paragraph = json['body'];
  }
  num? UserID;
  num? ID;
  String? titleBody;
  String? paragraph;
  Model copyWith({
    num? userId,
    num? id,
    String? title,
    String? body,
  }) =>
      Model(
        userId: userId ?? UserID,
        id: id ?? ID,
        title: title ?? titleBody,
        body: body ?? paragraph,
      );
  num? get userId => UserID;
  num? get id => ID;
  String? get title => titleBody;
  String? get body => paragraph;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['userId'] = UserID;
    map['id'] = ID;
    map['title'] = titleBody;
    map['body'] = paragraph;
    return map;
  }
}
