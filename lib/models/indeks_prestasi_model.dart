class IndeksPrestasiModel {
  final String? ipsnew;
  final String? ipsold;
  final String? ipknew;
  final String? ipkold;

  IndeksPrestasiModel({
    this.ipsnew,
    this.ipsold,
    this.ipknew,
    this.ipkold,
  });

  factory IndeksPrestasiModel.fromJson(Map<String, dynamic> json) =>
      IndeksPrestasiModel(
        ipsnew: json['IPSNOW'],
        ipsold: json['SELISIHIPS'],
        ipknew: json['IPKNOW'],
        ipkold: json['SELISIHIPK'],
      );
}
