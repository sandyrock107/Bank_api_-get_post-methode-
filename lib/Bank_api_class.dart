class Bank {
  late String bankName, ifsccode, branch, accounttype;
  late String accno;

  Bank(
      {required this.bankName,
      required this.ifsccode,
      required this.branch,
      required this.accounttype,
      required this.accno});
  Bank.fromJson(Map<String, dynamic> json) {
    print(json.toString());
    bankName = json['bankName'].toString();
    ifsccode = json['ifscCode'];
    branch = json['branch'];
    accounttype = json['accountType'];
    accno = json['accountNo'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['bankName'] = this.bankName;
    data['ifsccode'] = this.ifsccode;
    data['branch'] = this.branch;
    data['accounttype'] = this.accounttype;
    data['accno'] = this.accno;
    return data;
  }
}
