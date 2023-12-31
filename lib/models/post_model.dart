class PostModel {
  final String? postId;
  final String? time;
  final String? description;
  final String? postedBy;
  final List<String>? likeList;
  final List<String>? commentIdList;
  final String? imageLink;
  final String? userProfileImage;
  final String? username;
  final int? visibility;
  final int? noOfBlocks;
  final String? lastComment;
  final String? lastCommentedById;
  final String? lastCommentedByName;
  final String? lastCommentByImage;

  PostModel({
    this.postId,
    this.time,
    this.description,
    this.postedBy,
    this.likeList,
    this.commentIdList,
    this.imageLink,
    this.userProfileImage,
    this.username,
    this.visibility,
    this.noOfBlocks,
    this.lastComment,
    this.lastCommentedById,
    this.lastCommentedByName,
    this.lastCommentByImage,
  });

  Map<String, dynamic> toMap() {
    return {
      'time': time?.toString(),
      'description': description,
      'postId': postId,
      'postedBy': postedBy,
      'likeList': likeList,
      'commentList': commentIdList,
      'imageLink': imageLink,
      'userProfileImage': userProfileImage,
      'username': username,
      'visibility': visibility,
      'noOfBlocks': noOfBlocks,
      'lastComment': lastComment,
      'lastCommentedById': lastCommentedById,
      'lastCommentedByName': lastCommentedByName,
      'lastCommentByImage': lastCommentByImage,
    };
  }

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      time: json['time'] as String?,
      postId: json['postId'] as String?,
      description: json['description'] as String?,
      postedBy: json['postedBy'] as String?,
      likeList: (json['likeList'] as List<dynamic>?)?.map((item) => item.toString()).toList(),
      commentIdList: (json['commentList'] as List<dynamic>?)?.map((item) => item.toString()).toList(),
      imageLink: json['imageLink'] as String?,
      userProfileImage: json['userProfileImage'] as String?,
      username: json['username'] as String?,
      visibility: json['visibility'] as int?,
      noOfBlocks: json['noOfBlocks'] as int?,
      lastComment: json['lastComment'] as String?,
      lastCommentedById: json['lastCommentedById'] as String?,
      lastCommentedByName: json['lastCommentedByName'] as String?,
      lastCommentByImage: json['lastCommentByImage'] as String?,
    );
  }

}