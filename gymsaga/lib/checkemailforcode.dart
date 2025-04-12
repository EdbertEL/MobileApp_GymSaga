import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'login.dart';
import 'passwordreset.dart';

class CheckEmailForCodePage extends StatefulWidget {
  final String email;
  const CheckEmailForCodePage({super.key, required this.email});

  @override
  CheckEmailForCodeState createState() => CheckEmailForCodeState();
}

class CheckEmailForCodeState extends State<CheckEmailForCodePage> {
  final List<TextEditingController> _codeControllers =
      List.generate(4, (_) => TextEditingController());
  final List<FocusNode> _focusNodes = List.generate(4, (_) => FocusNode());
  bool _isCodeComplete = false;

  @override
  void initState() {
    super.initState();
    for (var controller in _codeControllers) {
      controller.addListener(_checkCodeCompletion);
    }
  }

  @override
  void dispose() {
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
      _isCodeComplete =
          _codeControllers.every((controller) => controller.text.isNotEmpty);
    });
  }

  void _handleVerification() {
    String enteredCode =
        _codeControllers.map((controller) => controller.text).join();

    // Navigasi ke halaman PasswordResetPage
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const PasswordResetPage(),
      ),
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 40),
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Check your email',
                        style: TextStyle(
                          fontFamily: 'Jersey25',
                          fontSize: 30,
                          color: Colors.white,
                          shadows: [
                            Shadow(
                              offset: Offset(2, 2),
                              blurRadius: 0,
                              color: Colors.black,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 8),
                      RichText(
                        textAlign: TextAlign.left,
                        text: TextSpan(
                          style: const TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 12,
                            color: Colors.black,
                          ),
                          children: [
                            const TextSpan(text: 'We sent a reset link to '),
                            TextSpan(
                              text: widget.email,
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            const TextSpan(
                              text:
                                  '\nenter 4 digit code that mentioned in the email',
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(4, (index) {
                          return Container(
                            width: 55,
                            height: 55,
                            margin: const EdgeInsets.symmetric(horizontal: 5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                color: const Color(0xFFEC9F59),
                                width: 2,
                              ),
                              color: const Color(0xFFFFF6DC),
                              boxShadow: const [
                                BoxShadow(
                                  color: Color(0xFFFFBD59),
                                  offset: Offset(2, 4),
                                  blurRadius: 0,
                                ),
                              ],
                            ),
                            alignment: Alignment.center,
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
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                              ),
                              onChanged: (value) {
                                if (value.length == 1 && index < 3) {
                                  FocusScope.of(context)
                                      .requestFocus(_focusNodes[index + 1]);
                                }
                              },
                            ),
                          );
                        }),
                      ),
                      const SizedBox(height: 50),

                      // Verify Button (unchanged)

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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                            onPressed: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('Code Resent')),
                              );
                            },
                            child: const Text(
                              'Resend Code',
                              style:
                                  TextStyle(fontSize: 14, color: Colors.blue),
                            ),
                          ),
                          const SizedBox(width: 20),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(
                                  builder: (context) => const LoginPage(),
                                ),
                                (route) => false,
                              );
                            },
                            child: const Text(
                              'Back to Login',
                              style:
                                  TextStyle(fontSize: 14, color: Colors.blue),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}