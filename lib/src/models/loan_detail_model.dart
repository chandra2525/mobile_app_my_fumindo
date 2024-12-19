class AssetLoanDetail {
  final int loanId;
  final String customerName;
  final String notes;
  final String status;
  final String loanDate;
  final User? user;
  final List<AssetLoan> assetLoans;

  AssetLoanDetail({
    required this.loanId,
    required this.customerName,
    required this.notes,
    required this.status,
    required this.loanDate,
    required this.user,
    required this.assetLoans,
  });

  factory AssetLoanDetail.fromJson(Map<String, dynamic> json) {
    return AssetLoanDetail(
      loanId: json['loan_id'] ?? 0,
      customerName: json['customer_name'] ?? '',
      notes: json['notes'] ?? '',
      status: json['status'] ?? '',
      loanDate: json['loan_date'] ?? '',
      user: json['user'] != null ? User.fromJson(json['user']) : null,
      assetLoans: (json['loanAsset'] as List)
          .map((loan) => AssetLoan.fromJson(loan))
          .toList(),
    );
  }
}

class User {
  final int userId;
  final String username;
  final String role;

  User({
    required this.userId,
    required this.username,
    required this.role,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      userId: json['user_id'],
      username: json['username'],
      role: json['role'],
    );
  }
}

class AssetLoan {
  final int assetLoanId;
  final int loanId;
  final int assetId;
  final String inputMethod;
  final int quantity;
  final Asset? asset;

  AssetLoan({
    required this.assetLoanId,
    required this.loanId,
    required this.assetId,
    required this.inputMethod,
    required this.quantity,
    required this.asset,
  });

  factory AssetLoan.fromJson(Map<String, dynamic> json) {
    return AssetLoan(
      assetLoanId: json['asset_loan_id'] ?? 0,
      loanId: json['loan_id'] ?? 0,
      assetId: json['asset_id'] ?? 0,
      inputMethod: json['input_method'] ?? '',
      quantity: json['quantity'] ?? 0,
      asset: json['asset'] != null ? Asset.fromJson(json['asset']) : null,
    );
  }
}

class Asset {
  final int assetId;
  final String assetName;
  final String category;

  Asset({
    required this.assetId,
    required this.assetName,
    required this.category,
  });

  factory Asset.fromJson(Map<String, dynamic> json) {
    return Asset(
      assetId: json['asset_id'],
      assetName: json['asset_name'],
      category: json['category'],
    );
  }
}
