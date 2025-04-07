import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool _rememberMe = false;

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
                // Welcome Text with updated styling
                const Text(
                  'Welcome !',
                  style: TextStyle(
                    fontFamily: 'Jersey',
                    fontSize: 42,
                    fontWeight: FontWeight.bold,
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
                // Please enter your details with Inter font and smaller size
                const Text(
                  'Please enter your details',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 10,
                    color: Color(0xFF555555),
                  ),
                ),
                const SizedBox(
                    height: 50), // Increased spacing here from 20 to 40

                // White Form Container - Made size smaller
                Container(
                  width: 400, // Added width constraint
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
                  padding: const EdgeInsets.all(16), // Reduced padding
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Email Label
                      const Text(
                        'Email',
                        style: TextStyle(
                          fontSize: 14, // Reduced font size
                          color: Color.fromRGBO(26, 21, 21, 1),
                        ),
                      ),
                      const SizedBox(height: 2), // Reduced spacing
                      // Email TextField with smaller size
                      SizedBox(
                        height: 35, // Explicitly set height to make it smaller
                        child: TextField(
                          style: const TextStyle(fontSize: 13), // Smaller text
                          decoration: InputDecoration(
                            isDense: true, // Makes the text field more compact
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6),
                              borderSide: BorderSide.none,
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 0,
                              vertical: 6, // Reduced vertical padding
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
                      const SizedBox(height: 12), // Reduced spacing

                      // Password Label
                      const Text(
                        'Password',
                        style: TextStyle(
                          fontSize: 14, // Reduced font size
                          color: Color.fromRGBO(26, 21, 21, 1),
                        ),
                      ),
                      const SizedBox(height: 2), // Reduced spacing
                      // Password TextField with smaller size
                      SizedBox(
                        height: 35, // Explicitly set height to make it smaller
                        child: TextField(
                          obscureText: true,
                          style: const TextStyle(fontSize: 13), // Smaller text
                          decoration: InputDecoration(
                            isDense: true, // Makes the text field more compact
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6),
                              borderSide: BorderSide.none,
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 0,
                              vertical: 6, // Reduced vertical padding
                            ),
                            enabledBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black54),
                            ),
                            focusedBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black54),
                            ),
                            suffixIcon: const Icon(
                              Icons.visibility_off,
                              size: 18, // Smaller icon
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 12), // Reduced spacing

                      // Remember me only (forgot password removed)
                      Row(
                        children: [
                          // Remember me checkbox - made smaller
                          SizedBox(
                            height: 18, // Reduced size
                            width: 18, // Reduced size
                            child: Checkbox(
                              value: _rememberMe,
                              onChanged: (bool? value) {
                                setState(() {
                                  _rememberMe = value ?? false;
                                });
                              },
                            ),
                          ),
                          const SizedBox(width: 6), // Reduced spacing
                          const Text(
                            'Remember for 30 days',
                            style: TextStyle(
                              fontSize: 12, // Reduced font size
                              color: Color.fromARGB(255, 220, 220, 220),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 70), // Increased from 32 to 50

                // Sign Up Button (Pixelated) - Adjusted position of text
                Center(
                  child: InkWell(
                    onTap: () {
                      // Handle sign up
                    },
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
                        offset: const Offset(
                            0, -8), // Changed from -4 to -8 to move text higher
                        child: const Text(
                          'Sign Up',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 10), // Increased from 16 to 20

                // Sign Up with Google Button (Pixelated) - Adjusted position of text and logo
                Center(
                  child: InkWell(
                    onTap: () {
                      // Handle sign up with Google
                    },
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
                        offset: const Offset(0,
                            -8), // Changed from -4 to -8 to move content higher
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
                              'Sign Up with Google',
                              style: TextStyle(
                                fontSize: 13,
                                color: Colors.black87,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 30), // Increased from 16 to 30

                // Do you have an account? Login - with blue, clickable login button
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Do you have an account? ',
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xFF555555),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        // Handle login navigation
                      },
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                        minimumSize: Size.zero,
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      child: const Text(
                        'Login',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
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
