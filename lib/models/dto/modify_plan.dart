class ModifyPlan{
  late String name;
  late String description;

  ModifyPlan({required this.name, required this.description});

  factory ModifyPlan.fromJson(Map<String, dynamic> map) {
    return ModifyPlan(
        name: map['name'],
        description: map['description']
    );
  }

  Map<String, dynamic> toJson() => 
  {
    'name': name,
    'description': description,
  };
}