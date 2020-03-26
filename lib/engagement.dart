class Engagement {
  final String id;
  final String engagementType;
  int engagementColor = 0;
  final String type;
  final String status;
  final String topicName;
  final String productName;
  final String brandName;
  final String eoName;
  final String speakerName;
  String inviteesCount = '0';
  String attendeesConfirmedCount = '0';
  final String date;
  final String time;

  Engagement(
      this.id,
      this.engagementType,
      this.engagementColor,
      this.type,
      this.status,
      this.topicName,
      this.productName,
      this.brandName,
      this.eoName,
      this.speakerName,
      this.inviteesCount,
      this.attendeesConfirmedCount,
      this.date,
      this.time);
}
