
///1.内连序列化JSON
///Map<String, dynamic> user = JSON.decode(json);
//print('Howdy, ${user['name']}!');
///2.在模型类中序列化JSON
class User {
  final String name;
  final String email;

  User(this.name, this.email);
///一个User.fromJson 构造函数, 用于从一个map构造出一个 User实例 map structure
  User.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        email = json['email'];
///一个toJson 方法, 将 User 实例转化为一个map.
  Map<String, dynamic> toJson() => {
        'name': name,
        'email': email,
      };

//  Map userMap = JSON.decode(json);
//  var user = new User.fromJson(userMap);
//
//  print('Howdy, ${user.name}!');

  //要序列化一个user，我们只是将该User对象传递给该JSON.encode方法。
  //我们不需要手动调用toJson这个方法，因为JSON.encode已经为我们做了。
//  String json = JSON.encode(user);


}
