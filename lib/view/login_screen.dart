import 'package:flutter/material.dart';
import 'package:movie_nest/core/app_colors.dart';
import 'package:movie_nest/view/home_screen.dart';
import 'package:movie_nest/widget/textfield.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  bool isPasswordHidden = true;

  Future<void> loginUser() async {
    final prefs = await SharedPreferences.getInstance();

    final storedEmail = prefs.getString('userEmail');

    if (storedEmail == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('No account found. Please sign up')),
      );
      return;
    }

    if (emailController.text.trim() == storedEmail) {
      await prefs.setBool('isLoggedIn', true);

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) =>  HomeScreen()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Invalid email or password')),
      );
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 22),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               SizedBox(height: 100),
              Icon(
                Icons.movie_creation_outlined,
                color: AppColors.btnClr,
                size: 65,
              ),
               SizedBox(height: 40),
              Text(
                'Welcome Back',
                style: TextStyle(
                  fontSize: 36,
                  color: AppColors.txtClr,
                  fontWeight: FontWeight.bold,
                ),
              ),
               SizedBox(height: 20),
              Text(
                'Ready for your next feature?',
                style: TextStyle(color: AppColors.txtClr2, fontSize: 20),
              ),
               SizedBox(height: 70),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'EMAIL',
                  style: TextStyle(
                    color: AppColors.txtClr1,
                    letterSpacing: 1,
                    fontSize: 12,
                  ),
                ),
              ),
              CustomTextField(
                hint: 'name@gmail.com',
                suffixIcon: Icons.email_outlined,
                controller: emailController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Email is required';
                  } else if (!value.contains('@')) {
                    return 'Enter valid email';
                  }
                  return null;
                },
              ),
               SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'PASSWORD',
                  style: TextStyle(
                    color: AppColors.txtClr1,
                    letterSpacing: 1,
                    fontSize: 12,
                  ),
                ),
              ),
              CustomTextField(
                hint: '••••••••',
                obscure: isPasswordHidden,
                suffixIcon: isPasswordHidden
                    ? Icons.visibility_off_outlined
                    : Icons.visibility_outlined,
                onSuffixTap: () {
                  setState(() {
                    isPasswordHidden = !isPasswordHidden;
                  });
                },
                controller: passwordController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Password is required';
                  } else if (value.length < 6) {
                    return 'Password must be at least 6 characters';
                  }
                  return null;
                },
              ),
               SizedBox(height: 80),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      loginUser();
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize:  Size(300, 55),
                    backgroundColor: AppColors.btnClr,
                  ),
                  child: Text(
                    'Login',
                    style: TextStyle(
                      color: AppColors.txtClr,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
               SizedBox(height: 30),
              Center(
                child: Text(
                  'OR CONTINUE WITH',
                  style: TextStyle(
                    color: AppColors.txtClr1,
                    letterSpacing: 1,
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
