class AuditData {
  String processTime;
  String timestamp;
  String requestHost;
  String serverId;
  String environment;
  String release;
  String internal;

  AuditData(
      {this.processTime,
        this.timestamp,
        this.requestHost,
        this.serverId,
        this.environment,
        this.release,
        this.internal});

  AuditData.fromJson(Map<String, dynamic> json) {
    processTime = json['processTime'];
    timestamp = json['timestamp'];
    requestHost = json['requestHost'];
    serverId = json['serverId'];
    environment = json['environment'];
    release = json['release'];
    internal = json['internal'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['processTime'] = this.processTime;
    data['timestamp'] = this.timestamp;
    data['requestHost'] = this.requestHost;
    data['serverId'] = this.serverId;
    data['environment'] = this.environment;
    data['release'] = this.release;
    data['internal'] = this.internal;
    return data;
  }
}