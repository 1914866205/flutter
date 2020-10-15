class Share {
  int id;
  int userId;
  String title;
  String createTime;
  String updateTime;
  int isOriginal;
  String author;
  String cover;
  String summary;
  String auditStatus;
  String reason;
  String downloadUrl;
  int price;
  int buyCount;
  bool showFlag;

  Share(
      {this.id,
        this.userId,
        this.title,
        this.createTime,
        this.updateTime,
        this.isOriginal,
        this.author,
        this.downloadUrl,
        this.cover,
        this.summary,
        this.auditStatus,
        this.reason,
        this.price,
        this.buyCount,
        this.showFlag});

  Share.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['userId'];
    title = json['title'];
    createTime = json['createTime'];
    updateTime = json['updateTime'];
    isOriginal = json['isOriginal'];
    author = json['author'];
    cover = json['cover'];
    downloadUrl = json['downloadUrl'];
    summary = json['summary'];
    auditStatus = json['auditStatus'];
    reason = json['reason'];
    price = json['price'];
    buyCount = json['buyCount'];
    showFlag = json['showFlag'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['userId'] = this.userId;
    data['title'] = this.title;
    data['createTime'] = this.createTime;
    data['updateTime'] = this.updateTime;
    data['isOriginal'] = this.isOriginal;
    data['author'] = this.author;
    data['cover'] = this.cover;
    data['summary'] = this.summary;
    data['auditStatus'] = this.auditStatus;
    data['reason'] = this.reason;
    data['price'] = this.price;
    data['buyCount'] = this.buyCount;
    data['showFlag'] = this.showFlag;
    return data;
  }
}
