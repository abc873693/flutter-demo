class GeneratorModel {
  final String name;
  final double value;

  const GeneratorModel({this.name, this.value});

  GeneratorModel.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        value = json['value'] + .0;

  Map<String, dynamic> toJson() => {
        'name': name,
        'value': value,
      };
}
