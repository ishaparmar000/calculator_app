class CalculationHistoryModel {
  int? id;
  final String expression;
  final String result;
  final String createdAt;

  CalculationHistoryModel({
    this.id,
    required this.expression,
    required this.result,
    required this.createdAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'expression': expression,
      'result': result,
      'created_at': createdAt,
    };
  }
}