class DataModel {
  // int? page;
  // int? perPage;
  // int? total;
  // int? totalPages;
  List<UserModel>? data;
  //Support? support;

  DataModel(
       {//this.page,
      // this.perPage,
      // this.total,
      // this.totalPages,
      this.data,
      //this.support
      });

      factory DataModel.fromJson(Map<String, dynamic> json) {
    return DataModel(      
      data: (json["data"] as List).map((i) => UserModel.fromJson(i)).toList()
    );
  }
}

  

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['page'] = this.page;
//     data['per_page'] = this.perPage;
//     data['total'] = this.total;
//     data['total_pages'] = this.totalPages;
//     if (this.data != null) {
//       data['data'] = this.data!.map((v) => v.toJson()).toList();
//     }
//     if (this.support != null) {
//       data['support'] = this.support!.toJson();
//     }
//     return data;
//   }
// }

class UserModel {
  int? id;
  String? email;
  String? firstName;
  String? lastName;
  String? avatar;

  UserModel({this.id, this.email, this.firstName, this.lastName, this.avatar});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json["id"],
      email: json['email'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      avatar: json['avatar'],
    );
  }

  
}

// class Support {
//   String? url;
//   String? text;

//   Support({this.url, this.text});

//   Support.fromJson(Map<String, dynamic> json) {
//     url = json['url'];
//     text = json['text'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['url'] = this.url;
//     data['text'] = this.text;
//     return data;
//   }
// }