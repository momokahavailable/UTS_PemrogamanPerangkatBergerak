import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // Buat TextEditingController untuk mengontrol input
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _autoFillLogin() {
    _emailController.text = "DhikaPakekH@gmail.com"; 
    _passwordController.text = "Dhikaajh09"; 
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  // Validasi email
  bool _isEmailValid(String email) {
    final RegExp regex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    return regex.hasMatch(email);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEAEFF1), // Warna latar belakang yang lembut
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 50),
              const Icon(
                Icons.vpn_key_outlined,
                size: 100,
                color: Color(0xFF007BFF), // Warna ikon
              ),
              const SizedBox(height: 30),
              // Welcome Text
              const Text(
                'Welcome',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF333333), // Warna teks
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Add available accounts',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: const Color(0xFF666666), // Warna teks sekunder
                ),
              ),
              const SizedBox(height: 50),
              // Form Fields
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  hintText: 'Email',
                  prefixIcon: const Icon(Icons.mail, color: Color(0xFF007BFF)), // Warna ikon
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Colors.white, // Warna latar belakang field
                  // Tambahkan suffix icon untuk clear text
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.clear),
                    onPressed: () => _emailController.clear(),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Password',
                  prefixIcon: const Icon(Icons.lock, color: Color(0xFF007BFF)), // Warna ikon
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Colors.white, // Warna latar belakang field
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.clear),
                    onPressed: () => _passwordController.clear(),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              // Auto-fill Button
              TextButton(
                onPressed: _autoFillLogin,
                child: const Text(
                  'Auto Fill',
                  style: TextStyle(
                    color: Color(0xFF007BFF), // Warna tombol
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              // Login Button
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF007BFF), // Warna latar belakang tombol
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                onPressed: () {
                  // Cek kredensial sebelum navigasi
                  if (_emailController.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: const Text('Email cannot be empty'),
                        backgroundColor: Colors.red,
                      ),
                    );
                  } else if (!_isEmailValid(_emailController.text)) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: const Text('Please enter a valid email'),
                        backgroundColor: Colors.red,
                      ),
                    );
                  } else if (_passwordController.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: const Text('Password cannot be empty'),
                        backgroundColor: Colors.red,
                      ),
                    );
                  } else {
                    // Logic untuk memproses login
                    // Tampilkan loading indicator saat proses login
                    showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (context) => Center(child: CircularProgressIndicator()),
                    );

                    // Simulasi proses login
                    Future.delayed(Duration(seconds: 2), () {
                      Navigator.pop(context); // Menutup loading indicator
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        '/home',
                        (route) => false,
                      );
                    });
                  }
                },
                child: const Text('Login', style: TextStyle(fontSize: 16)),
              ),
              const SizedBox(height: 16),
              // Register Link
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Don\'t have an account? ',
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/register');
                    },
                    child: const Text(
                      'Register',
                      style: TextStyle(
                        color: Color(0xFF007BFF), // Warna tautan
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
