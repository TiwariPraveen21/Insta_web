class Comment {
  String? id;
  String? comment;
  String? time;
  String? commentedBy;
  String? postId;
  bool? isReplied;
  bool? isEdited;
  bool? isVisible;
  List<String>? report;
  List<String>? replies;

  Comment({
    this.id,
    this.comment,
    this.time,
    this.commentedBy,
    this.postId,
    this.isReplied = false,
    this.isEdited = false,
    this.isVisible = true,
    this.report = const [],
    this.replies = const [],
  });

  factory Comment.fromJson(Map<String, dynamic> json) {
    return Comment(
      id: json['id'],
      comment: json['comment'],
      time: json['time'],
      commentedBy: json['commentedBy'],
      postId: json['postId'],
      isReplied: json['isReplied'],
      isEdited: json['isEdited'],
      isVisible: json['isVisible'],
      report: List<String>.from(json['report'] ?? []),
      replies: List<String>.from(json['replies'] ?? []),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'comment': comment,
      'time': time,
      'commentedBy': commentedBy,
      'postId': postId,
      'isReplied': isReplied,
      'isEdited': isEdited,
      'isVisible': isVisible,
      'report': report,
      'replies': replies,
    };
  }
}

class PostCommentListModel {
  final List<Comment>? postCommentList;

  PostCommentListModel({
    this.postCommentList,
  });

  factory PostCommentListModel.fromJson(Map<String, dynamic> json) {
    return PostCommentListModel(
      postCommentList: (json['postCommentList'] as List<dynamic>?)
          ?.map((item) => Comment.fromJson(item as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'postCommentList': postCommentList?.map((item) => item.toJson()).toList(),
    };
  }
}