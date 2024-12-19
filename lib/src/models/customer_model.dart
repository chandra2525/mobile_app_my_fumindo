class CustomerModel {
  final int customerId;
  final String customerName;

  CustomerModel({
    required this.customerId,
    required this.customerName,
  });

  factory CustomerModel.fromJson(Map<String, dynamic> json) {
    return CustomerModel(
      customerId: json['customer_id'],
      customerName: json['customer_name'],
    );
  }
}
