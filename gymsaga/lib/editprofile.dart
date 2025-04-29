import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

// Define a class to hold profile data for easy passing between screens
class ProfileData {
  final String name;
  final String goal;
  final String avatarPath;

  ProfileData({
    required this.name,
    required this.goal,
    required this.avatarPath,
  });
}

class EditProfilePage extends StatefulWidget {
  final String initialName;
  final String initialGoal;
  final String initialAvatarPath;
  final String startingWeight;

  const EditProfilePage({
    super.key,
    required this.initialName,
    required this.initialGoal,
    required this.initialAvatarPath,
    required this.startingWeight,
  });

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  bool isEditingName = false;
  bool isEditingGoal = false;
  bool isEditingAvatar = false;

  late String name;
  late String goal;
  late String avatarPath;
  late String startingWeight;

  final nameController = TextEditingController();
  final goalController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Initialize with values passed from ProfilePage
    name = widget.initialName;
    goal = widget.initialGoal;
    avatarPath = widget.initialAvatarPath;
    startingWeight = widget.startingWeight;

    nameController.text = name;
    goalController.text = goal;
  }

  @override
  void dispose() {
    nameController.dispose();
    goalController.dispose();
    super.dispose();
  }

  void openAvatarEditing() {
    setState(() {
      isEditingAvatar = true;
    });
  }

  void selectAvatar(String path) {
    setState(() {
      avatarPath = path;
      isEditingAvatar = false;
    });
  }

  Widget buildAvatarArea() {
    if (isEditingName || isEditingGoal || isEditingAvatar) {
      // Avatar editing mode
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.orange, // orange background
          borderRadius: BorderRadius.circular(40), // fully rounded
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Male avatar button
            GestureDetector(
              onTap: () {
                setState(() {
                  avatarPath = 'assets/widgets/images/male_profile.png';
                  isEditingAvatar = false;
                  // Just update state, don't return to previous page
                  updateProfileData();
                });
              },
              child: CircleAvatar(
                radius: 30, // same size
                backgroundColor: Colors.black,
                child: CircleAvatar(
                  radius: 28,
                  backgroundImage: AssetImage('assets/widgets/images/male_profile.png'),
                ),
              ),
            ),
            const SizedBox(width: 16),

            // Female avatar button
            GestureDetector(
              onTap: () {
                setState(() {
                  avatarPath = 'assets/widgets/images/female_profile.png';
                  isEditingAvatar = false;
                  // Just update state, don't return to previous page
                  updateProfileData();
                });
              },
              child: CircleAvatar(
                radius: 30, // same size
                backgroundColor: Colors.black,
                child: CircleAvatar(
                  radius: 28,
                  backgroundImage: AssetImage('assets/widgets/images/female_profile.png'),
                ),
              ),
            ),
            const SizedBox(width: 16),

            // Camera button
            GestureDetector(
              onTap: pickImageFromGallery, // your gallery picker function
              child: CircleAvatar(
                radius: 30,
                backgroundColor: Colors.white, // white circle background
                child: Icon(
                  Icons.camera_alt,
                  color: Colors.black, // black camera icon
                  size: 28,
                ),
              ),
            ),
          ],
        ),
      );

    } else {
      // Normal avatar
      return GestureDetector(
        onTap: openAvatarEditing,
        child: CircleAvatar(
          radius: 40,
          backgroundColor: Colors.black,
          child: CircleAvatar(
            radius: 38,
            backgroundImage: AssetImage(avatarPath),
          ),
        ),
      );
    }
  }

  Future<void> pickImageFromGallery() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        avatarPath = image.path;
        isEditingAvatar = false; // Close after picking
        // Just update state, don't return to previous page
        updateProfileData();
      });
    }
  }

  Widget buildEditableField({
    required String label,
    required bool isEditing,
    required TextEditingController controller,
    required VoidCallback onToggle,
    bool enabled = true,
  }) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        image: const DecorationImage(
          image: AssetImage('assets/widgets/background/frame.png'),
          fit: BoxFit.fill,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                label,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              const SizedBox(width: 8),
              if (enabled)
                GestureDetector(
                  onTap: () {
                    if (isEditing) {
                      setState(() {
                        if (label == 'Name') {
                          name = controller.text;
                          isEditingName = false;
                          isEditingAvatar = false;
                          // Just update state, don't return to previous page
                          updateProfileData();
                        } else if (label == 'Weigh Goal') {
                          goal = controller.text;
                          isEditingGoal = false;
                          isEditingAvatar = false;
                          // Just update state, don't return to previous page
                          updateProfileData();
                        }
                      });
                    } else {
                      onToggle();
                      openAvatarEditing();
                    }
                  },
                  child: Image.asset(
                    isEditing
                        ? 'assets/widgets/buttons/confirm_button.png'
                        : 'assets/widgets/buttons/edit_button.png',
                    width: 20,
                    height: 20,
                  ),
                ),
            ],
          ),
          const SizedBox(height: 4),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: isEditing
                ? TextField(
              controller: controller,
              enabled: enabled,
              decoration: InputDecoration(
                isDense: true,
                filled: true,
                fillColor: Colors.white,
                contentPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.black, width: 2),
                  borderRadius: BorderRadius.circular(4),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.black, width: 2),
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
            )
                : Text(
              controller.text,
              style: TextStyle(
                fontSize: 16,
                color: enabled ? Colors.black : Colors.grey[600],
              ),
            ),
          )
        ],
      ),
    );
  }

  // Function to update profile data without returning to ProfilePage
  void updateProfileData() {
    setState(() {
      // This just updates the internal state, doesn't return to previous page
    });
  }

  // Function to save changes and return to ProfilePage - only used for back button
  void saveChangesAndReturn() {
    // Return updated profile data to ProfilePage
    final updatedData = ProfileData(
      name: name,
      goal: goal,
      avatarPath: avatarPath,
    );
    Navigator.pop(context, updatedData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // This ensures the content is properly scrollable and adjusts for the keyboard
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/widgets/background/checkerboard.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              // Header
              Container(
                height: 100,
                decoration: BoxDecoration(
                  color: const Color(0xFFF7E4C3),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      offset: const Offset(0, 3),
                      blurRadius: 4,
                    ),
                  ],
                ),
                child: Stack(
                  children: [
                    Positioned(
                      left: 16,
                      top: 0,
                      bottom: 0,
                      child: Center(
                        child: GestureDetector(
                          onTap: () {
                            // Return current data when using back button
                            saveChangesAndReturn();
                          },
                          child: Image.asset(
                            'assets/widgets/buttons/back_button.png',
                            width: 48,
                            height: 48,
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: Stack(
                        children: [
                          Text(
                            'EDIT PROFILE',
                            style: TextStyle(
                              fontSize: 32,
                              fontFamily: 'Jersey25',
                              foreground: Paint()
                                ..style = PaintingStyle.stroke
                                ..strokeWidth = 3
                                ..color = Colors.black,
                            ),
                          ),
                          const Text(
                            'EDIT PROFILE',
                            style: TextStyle(
                              fontSize: 32,
                              fontFamily: 'Jersey25',
                              color: Colors.white,
                              shadows: [
                                Shadow(
                                  offset: Offset(0, 5),
                                  blurRadius: 0,
                                  color: Colors.black54,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              // Make the content scrollable
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom,
                  ),
                  child: Column(
                    children: [
                      const SizedBox(height: 16),

                      // Avatar Area
                      buildAvatarArea(),

                      const SizedBox(height: 24),

                      // Editable Name Field
                      buildEditableField(
                        label: 'Name',
                        isEditing: isEditingName,
                        controller: nameController,
                        onToggle: () {
                          setState(() {
                            isEditingName = true;
                          });
                        },
                      ),

                      // Non-editable Starting Weight
                      buildEditableField(
                        label: 'Starting Weight',
                        isEditing: false,
                        controller: TextEditingController(text: startingWeight),
                        onToggle: () {},
                        enabled: false,
                      ),

                      // Editable Goal Field
                      buildEditableField(
                        label: 'Weigh Goal',
                        isEditing: isEditingGoal,
                        controller: goalController,
                        onToggle: () {
                          setState(() {
                            isEditingGoal = true;
                          });
                        },
                      ),

                      // Add extra padding at the bottom to ensure all content is accessible
                      const SizedBox(height: 20),
                    ],
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