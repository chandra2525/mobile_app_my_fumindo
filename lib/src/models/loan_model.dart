class LoanModel {
  final int loanId;
  final String customerName;
  final String status;
  final String loanDate;

  LoanModel({
    required this.loanId,
    required this.customerName,
    required this.status,
    required this.loanDate,
  });

  factory LoanModel.fromJson(Map<String, dynamic> json) {
    return LoanModel(
      loanId: json['loan_id'],
      customerName: json['customer_name'],
      status: json['status'],
      loanDate: json['loan_date'],
    );
  }
}
