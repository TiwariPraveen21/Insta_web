class AddLike{
  List<String> postLikeList;
  String userId;
  
  AddLike({
    required this.postLikeList, 
  required this.userId});

  Map<String, dynamic> toMap(){
    postLikeList.add(userId);
    return {
      'postLikeList' : postLikeList,
    };
  }
}

class PostLikeModel {
  final List<String>? likeList;

  PostLikeModel({
    this.likeList,
  });

  factory PostLikeModel.fromJson(Map<String, dynamic> json) {
    return PostLikeModel(
      likeList: (json['likeList'] as List<dynamic>?)?.map((item) => item.toString()).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'likeList': likeList,
    };
  }
}