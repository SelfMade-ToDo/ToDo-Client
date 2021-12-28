class AddPlan {
  late String name;
  late String description;

  AddPlan({required this.name, required this.description});

  factory AddPlan.fromJson(Map<String, dynamic> map) {
    return AddPlan(
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