import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Import for InputFormatters
import 'login.dart'; // Import the login page for navigation

class CheckEmailForCodePage extends StatefulWidget {
  final String email; // Email passed from Forgot Password page

  const CheckEmailForCodePage({
    super.key,
    required this.email,
  });

  @override
  CheckEmailForCodeState createState() => CheckEmailForCodeState();
}

class CheckEmailForCodeState extends State<CheckEmailForCodePage> {
  // List of text editing controllers for 4 code input fields
  final List<TextEditingController> _codeControllers = List.generate(
    4,
    (_) => TextEditingController(),
  );

  // List of focus nodes to manage input focus between code fields
  final List<FocusNode> _focusNodes = List.generate(
    4,
    (_) => FocusNode(),
  );

  bool _isCodeComplete = false;

  @override
  void initState() {
    super.initState();

    // Add listeners to check if all code fields are filled
    for (var controller in _codeControllers) {
      controller.addListener(_checkCodeCompletion);
    }
  }

  @override
  void dispose() {
    // Dispose controllers and focus nodes
    for (var controller in _codeControllers) {
      controller.dispose();
    }
    for (var focusNode in _focusNodes) {
      focusNode.dispose();
    }
    super.dispose();
  }

  void _checkCodeCompletion() {
    setState(() {
      // Check if all 4 code fields are non-empty
      _isCodeComplete =
          _codeControllers.every((controller) => controller.text.isNotEmpty);
    });
  }

  void _handleVerification() {
    // Collect the entered code from controllers
    String enteredCode =
        _codeControllers.map((controller) => controller.text).join();

    // TODO: Implement actual verification logic
    // For now, just log to console or show a snackbar
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Verification code entered: $enteredCode')),
    );
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
                // Check Email Text with styling
                const Text(
                  'Check Email',
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
                // Subtitle with Inter font
                Text(
                  'Enter 4-digit code sent to ${widget.email}',
                  style: const TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 10,
                    color: Color(0xFF555555),
                  ),
                ),
                const SizedBox(height: 50),
                // White Form Container
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
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Email Display
                      Text(
                        widget.email,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Color.fromRGBO(26, 21, 21, 1),
                        ),
                      ),
                      const SizedBox(height: 20),
                      // Code Input Fields
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(4, (index) {
                          return Container(
                            width: 50,
                            height: 50,
                            margin: const EdgeInsets.symmetric(horizontal: 5),
                            child: TextField(
                              controller: _codeControllers[index],
                              focusNode: _focusNodes[index],
                              textAlign: TextAlign.center,
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(1),
                                FilteringTextInputFormatter.digitsOnly,
                              ],
                              style: const TextStyle(fontSize: 24),
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide.none,
                                ),
                                contentPadding: EdgeInsets.zero,
                              ),
                              onChanged: (value) {
                                // Auto move focus to next field when a digit is entered
                                if (value.length == 1 && index < 3) {
                                  FocusScope.of(context)
                                      .requestFocus(_focusNodes[index + 1]);
                                }
                              },
                            ),
                          );
                        }),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 70),
                // Verify Button
                Center(
                  child: InkWell(
                    onTap: _isCodeComplete ? _handleVerification : null,
                    child: Opacity(
                      opacity: _isCodeComplete ? 1.0 : 0.5,
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
                            'Verify',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 13,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                // Resend Code and Back to Login options
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {
                        // Handle resend code logic
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Code Resent')),
                        );
                      },
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                        minimumSize: Size.zero,
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      child: const Text(
                        'Resend Code',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                    TextButton(
                      onPressed: () {
                        // Navigate back to login page
                        Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                            builder: (context) => const LoginPage(),
                          ),
                          (Route<dynamic> route) => false,
                        );
                      },
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                        minimumSize: Size.zero,
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      child: const Text(
                        'Back to Login',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
