class User {
  final int? id;
  final String username;
  final String email;
  final String pwd;
  final double weight;
  final double height;
  final double bmi;
  final String bmiType;
  final double target;

  // Constructor
  User({
    this.id,
    required this.username,
    required this.email,
    required this.pwd,
    required this.weight,
    required this.height,
  }) : bmi = calculateBmi(weight, height),
       bmiType = determineBmiType(calculateBmi(weight, height)),
       target = getWeightAdvice(weight, height);

  // BMI Calculation
  static double calculateBmi(double weight, double height) {
    double cal_bmi = weight / ((height / 100) * (height / 100));
    return double.parse(cal_bmi.toStringAsFixed(2));
  }

  // Determine BMI Type
  static String determineBmiType(double bmi) {
    if (bmi < 18.5) {
      return 'Underweight';
    } else if (bmi < 22.9) {
      return 'Normal';
    } else if (bmi < 24.9) {
      return 'Rick To Overweight';
    } else if (bmi < 29.9) {
      return 'Overweight';
    } else {
      return 'Obese';
    }
  }

  // Weight Advice
  static double getWeightAdvice(double weight, double height) {
    double bmi = weight / ((height / 100) * (height / 100));
    double cal;
    if (bmi < 18.5) {
      cal = 19 * ((height / 100) * (height / 100));
      double resulte = cal - weight;
      return double.parse(resulte.toStringAsFixed(2));
    } else if (bmi > 22.9) {
      cal = 22 * ((height / 100) * (height / 100));
      double resulte = weight - cal;
      return double.parse(resulte.toStringAsFixed(2));
    } else {
      double resulte = 0;
      return double.parse(resulte.toStringAsFixed(2));
    }
  }

  // Convert User object to Map (for DB insertion)
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'username': username,
      'email': email,
      'pwd': pwd,
      'weight': weight,
      'height': height,
      'bmi': bmi, // Store BMI in DB
      'bmi_type': bmiType, // Store BMI Type in DB
      'bmi_target': target,
    };
  }

  // Create User object from Map (for DB queries)
  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'],
      username: map['username'],
      email: map['email'],
      pwd: map['pwd'],
      weight: map['weight'],
      height: map['height'],
    );
  }
}
