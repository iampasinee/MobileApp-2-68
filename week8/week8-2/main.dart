import 'package:flutter/material.dart';
import 'database_helper.dart';
import 'user.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DatabaseHelper.instance.initDb();
  await DatabaseHelper.instance.initializeUsers();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'User Management',
      home: UserList(),
    );
  }
}

class UserList extends StatefulWidget {
  const UserList({super.key});

  @override
  State<UserList> createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  List<User> _users = [];

  @override
  void initState() {
    super.initState();
    _fetchUsers();
  }

  Future<void> _fetchUsers() async {
    final userMaps = await DatabaseHelper.instance.queryAllUsers();
    setState(() {
      _users = userMaps.map((userMap) => User.fromMap(userMap)).toList();
    });
  }

  Future<void> _deleteUser(int userId) async {
    await DatabaseHelper.instance.deleteUser(userId);
    _fetchUsers();
  }

  Future<void> _showUserDialog({User? user}) async {
    final usernameController = TextEditingController(
      text: user?.username ?? '',
    );
    final emailController = TextEditingController(text: user?.email ?? '');
    final pwdController = TextEditingController(text: user?.pwd ?? '');
    final weightController = TextEditingController(
      text: user?.weight.toString() ?? '',
    );
    final heightController = TextEditingController(
      text: user?.height.toString() ?? '',
    );

    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(user == null ? 'Add User' : 'Edit User'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: usernameController,
                decoration: const InputDecoration(labelText: 'Username'),
              ),
              TextField(
                controller: emailController,
                decoration: const InputDecoration(labelText: 'Email'),
              ),
              TextField(
                controller: pwdController,
                decoration: const InputDecoration(labelText: 'Password'),
              ),
              TextField(
                controller: weightController,
                decoration: const InputDecoration(labelText: 'Weight (kg)'),
              ),
              TextField(
                controller: heightController,
                decoration: const InputDecoration(labelText: 'Height (cm)'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () async {
                final weight = double.tryParse(weightController.text);
                final height = double.tryParse(heightController.text);
                if (weight == null || height == null) {
                  return;
                }

                final targetUser = User(
                  id: user?.id,
                  username: usernameController.text,
                  email: emailController.text,
                  pwd: pwdController.text,
                  weight: weight,
                  height: height,
                );

                if (user == null) {
                  await DatabaseHelper.instance.insertUser(targetUser);
                } else {
                  await DatabaseHelper.instance.updateUser(targetUser);
                }

                if (!mounted) {
                  return;
                }
                Navigator.pop(context);
                _fetchUsers();
              },
              child: Text(user == null ? 'Add' : 'Save'),
            ),
          ],
        );
      },
    );
  }

  Future<void> _deleteAllUser() async {
    await DatabaseHelper.instance.deleteAllUsers();
    _fetchUsers();
  }

  String _bmiImagePath(double bmi) {
    if (bmi < 18.5) return 'assets/images/bmi-1.png';
    if (bmi < 22.9) return 'assets/images/bmi-2.png';
    if (bmi < 24.9) return 'assets/images/bmi-3.png';
    if (bmi < 29.9) return 'assets/images/bmi-4.png';
    return 'assets/images/bmi-5.png';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Show User List'),
        actions: [
          IconButton(
            onPressed: _deleteAllUser,
            icon: const Icon(Icons.delete_forever),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: _users.length,
        itemBuilder: (context, index) {
          final user = _users[index];
          return ListTile(
            leading: Image.asset(
              _bmiImagePath(user.bmi),
              width: 48,
              height: 48,
              fit: BoxFit.contain,
              errorBuilder: (_, __, ___) => const Icon(Icons.person),
            ),
            title: Text(user.username),
            subtitle: Text(
              'Email: ${user.email}\n'
              'Weight: ${user.weight} kg, Height: ${user.height} cm\n'
              'BMI: ${user.bmi} (${user.bmiType})\n'
              'Weight Target: ${user.bmi > 22.9 ? '-' : '+'} ${user.target} kg',
            ),
            isThreeLine: true,
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: () => _showUserDialog(user: user),
                ),
                IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () => _deleteUser(user.id!),
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showUserDialog(),
        child: const Icon(Icons.add),
      ),
    );
  }
}
