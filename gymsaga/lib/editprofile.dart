import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  bool isEditingName = false;
  bool isEditingGoal = false;
  bool isEditingAvatar = false; // NEW STATE

  String name = 'Katie';
  String goal = '50.00';
  final String startingWeight = '60.4 kg';
  String avatarPath = 'assets/widgets/images/female_profile.png'; // NEW AVATAR PATH

  final nameController = TextEditingController();
  final goalController = TextEditingController();

  @override
  void initState() {
    super.initState();
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
                        } else if (label == 'Weigh Goal') {
                          goal = controller.text;
                          isEditingGoal = false;
                          isEditingAvatar = false;
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
        child: Container(
        decoration: const BoxDecoration(
        image: DecorationImage(
        image: AssetImage('assets/widgets/background/checkerboard.png'), // << Your checkerboard
    fit: BoxFit.cover, // or BoxFit.fill, depending how you want it
    ),
    ),
    child: Column(
    children: [            // Header
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
                        onTap: () => Navigator.pop(context),
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
          ],
        ),
      ),),
    );
  }
}