import 'package:flutter/material.dart';
import 'package:gymsaga/loadingpage.dart';
import 'forgotpassword.dart';
import 'register.dart';
import 'homepage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _rememberMe = false;
  bool _obscurePassword = true;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // Validasi Email
  bool _isValidEmail(String email) {
    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+$');
    return emailRegex.hasMatch(email);
  }

  // Metode Login dengan Email dan Password
  void _loginWithEmailPassword() {
    String email = _emailController.text.trim();
    String password = _passwordController.text.trim();

    // Validasi input
    if (email.isEmpty || password.isEmpty) {
      _showErrorDialog('Harap isi email dan password');
      return;
    }

    if (!_isValidEmail(email)) {
      _showErrorDialog('Format email tidak valid');
      return;
    }

    // Tampilkan loading dialog
    _showLoadingDialog();

    // Navigasi ke HomePage setelah login berhasil
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.of(context).pop(); // Tutup loading dialog
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoadingScreen()),
      );
    });
  }

  // Metode Login dengan Google
  void _loginWithGoogle() {
    // Tampilkan loading dialog
    _showLoadingDialog();

    // Navigasi ke HomePage setelah login Google
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.of(context).pop(); // Tutup loading dialog
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoadingScreen()),
      );
    });
  }

  // Tampilkan dialog loading
  void _showLoadingDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          elevation: 0,
          child: Center(
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  CircularProgressIndicator(
                    valueColor:
                        AlwaysStoppedAnimation<Color>(Color(0xFFD4AF37)),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Logging in...",
                    style: TextStyle(
                      fontFamily: 'Jersey25',
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  // Tampilkan dialog error
  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Error'),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9DEAF),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 40),
                // Welcome Text
                const Text(
                  'Welcome !',
                  style: TextStyle(
                    fontFamily: 'Jersey25',
                    fontSize: 42,
                    color: Colors.white,
                    shadows: [
                      Shadow(
                        offset: Offset(2, 4),
                        blurRadius: 15.0,
                        color: Color.fromARGB(100, 0, 0, 0),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                // Subtitle
                const Text(
                  'Please enter your details',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 10,
                    color: Color(0xFF555555),
                  ),
                ),
                const SizedBox(height: 50),
                // Login Form Container
                Container(
                  width: 400,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 237, 239, 220),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withAlpha(25),
                        blurRadius: 10,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Email Label
                      const Text(
                        'Email',
                        style: TextStyle(
                          fontSize: 14,
                          color: Color.fromRGBO(26, 21, 21, 1),
                        ),
                      ),
                      const SizedBox(height: 2),
                      // Email TextField
                      SizedBox(
                        height: 35,
                        child: TextField(
                          controller: _emailController,
                          style: const TextStyle(fontSize: 13),
                          decoration: InputDecoration(
                            isDense: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6),
                              borderSide: BorderSide.none,
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 0,
                              vertical: 6,
                            ),
                            enabledBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black54),
                            ),
                            focusedBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black54),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),
                      // Password Label
                      const Text(
                        'Password',
                        style: TextStyle(
                          fontSize: 14,
                          color: Color.fromRGBO(26, 21, 21, 1),
                        ),
                      ),
                      const SizedBox(height: 2),
                      // Password TextField
                      SizedBox(
                        height: 35,
                        child: TextField(
                          controller: _passwordController,
                          obscureText: _obscurePassword,
                          style: const TextStyle(fontSize: 13),
                          decoration: InputDecoration(
                            isDense: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6),
                              borderSide: BorderSide.none,
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 0,
                              vertical: 6,
                            ),
                            enabledBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black54),
                            ),
                            focusedBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black54),
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(
                                _obscurePassword
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                size: 18,
                              ),
                              onPressed: () {
                                setState(() {
                                  _obscurePassword = !_obscurePassword;
                                });
                              },
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),
                      // Remember me and Forgot Password Row
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Remember me checkbox
                          Row(
                            children: [
                              SizedBox(
                                height: 18,
                                width: 18,
                                child: Checkbox(
                                  value: _rememberMe,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      _rememberMe = value ?? false;
                                    });
                                  },
                                ),
                              ),
                              const SizedBox(width: 6),
                              const Text(
                                'Remember for 30 days',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Color.fromARGB(255, 220, 220, 220),
                                ),
                              ),
                            ],
                          ),
                          // Forgot Password
                          TextButton(
                            onPressed: () {
                              // Navigate to Forgot Password Page
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const ForgotPasswordPage(),
                                ),
                              );
                            },
                            child: const Text(
                              'Forgot password?',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.blue,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 70),
                // Login Button (Pixelated)
                Center(
                  child: InkWell(
                    onTap: _loginWithEmailPassword,
                    child: Container(
                      height: 50,
                      width: 240,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                              'assets/widgets/buttons/golden_button.png'),
                          fit: BoxFit.fill,
                        ),
                      ),
                      alignment: Alignment.center,
                      child: Transform.translate(
                        offset: const Offset(0, -8),
                        child: const Text(
                          'Login',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                // Login with Google Button (Pixelated)
                Center(
                  child: InkWell(
                    onTap: _loginWithGoogle,
                    child: Container(
                      height: 50,
                      width: 240,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                              'assets/widgets/buttons/silver_button.png'),
                          fit: BoxFit.fill,
                        ),
                      ),
                      alignment: Alignment.center,
                      child: Transform.translate(
                        offset: const Offset(0, -8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/widgets/images/google_logo.png',
                              height: 24,
                              width: 24,
                            ),
                            const SizedBox(width: 8),
                            const Text(
                              'Log in with Google',
                              style: TextStyle(
                                fontSize: 13,
                                color: Colors.black87,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                // Don't have an account? Sign Up
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Don\'t have an account? ',
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xFF555555),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        // Navigate to Register Page
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const RegisterPage(),
                          ),
                        );
                      },
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                        minimumSize: Size.zero,
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      child: const Text(
                        'Sign Up',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                // Dumbbell Image
                Image.asset(
                  'assets/widgets/images/dumbell_image.png',
                  height: 300,
                  width: 300,
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
