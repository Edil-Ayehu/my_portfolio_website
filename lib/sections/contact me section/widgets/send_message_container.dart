import 'package:flutter_portfolio_website/export.dart';
import 'package:flutter_portfolio_website/services/send_email_service.dart';

class SendMessageContainer extends StatefulWidget {
  final bool isMobile;
  const SendMessageContainer({super.key, this.isMobile = false});

  @override
  _SendMessageContainerState createState() => _SendMessageContainerState();
}

class _SendMessageContainerState extends State<SendMessageContainer> {
  final _formKey = GlobalKey<FormState>();
  final fullNameEditingController = TextEditingController();
  final emailEditingController = TextEditingController();
  final subjectEditingController = TextEditingController();
  final messageEditingController = TextEditingController();
  bool isLoading = false;

  void showSnackBar(BuildContext context, String message, Color color) {
    final snackBar = SnackBar(
      content: Text(message, style: TextStyle(color: Colors.white)),
      backgroundColor: color,
      behavior: SnackBarBehavior.floating,
      width: MediaQuery.of(context).size.width * 0.6,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(34)),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  bool isValidEmail(String email) {
    String pattern = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
    RegExp regex = RegExp(pattern);
    return regex.hasMatch(email);
  }

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final size = MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: isDarkMode ? Color(0xFF1E1E1E) : Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 20,
            offset: Offset(0, 10),
          ),
        ],
      ),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Send Message',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: isDarkMode ? Colors.white : Colors.black,
              ),
            ),
            SizedBox(height: 24),
            _buildTextField(
              controller: fullNameEditingController,
              hint: 'Full Name',
              isDarkMode: isDarkMode,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Name is required';
                }
                return null;
              },
            ),
            SizedBox(height: 16),
            _buildTextField(
              controller: emailEditingController,
              hint: 'Email',
              isDarkMode: isDarkMode,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Email is required';
                }
                if (!isValidEmail(value)) {
                  return 'Please enter a valid email';
                }
                return null;
              },
            ),
            SizedBox(height: 16),
            _buildTextField(
              controller: subjectEditingController,
              hint: 'Subject',
              isDarkMode: isDarkMode,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Subject is required';
                }
                return null;
              },
            ),
            SizedBox(height: 16),
            _buildTextField(
              controller: messageEditingController,
              hint: 'Message',
              isDarkMode: isDarkMode,
              maxLines: 4,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Message is required';
                }
                return null;
              },
            ),
            SizedBox(height: 32),
            Align(
              alignment: Alignment.centerRight,
              child: MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () async {
                    if (_formKey.currentState!.validate()) {
                      setState(() {
                        isLoading = true;
                      });

                      try {
                        await SendEmailService.sendMail(
                          name: fullNameEditingController.text,
                          email: emailEditingController.text,
                          subject: subjectEditingController.text,
                          message: messageEditingController.text,
                        );
                        setState(() {
                          isLoading = false;
                        });

                        showSnackBar(context, 'Message sent successfully!',
                            const Color.fromARGB(255, 13, 79, 14));

                        fullNameEditingController.clear();
                        emailEditingController.clear();
                        subjectEditingController.clear();
                        messageEditingController.clear();
                      } catch (error) {
                        setState(() {
                          isLoading = false;
                        });

                        showSnackBar(context, 'Failed to send message!',
                            const Color.fromARGB(255, 56, 10, 7));
                      }
                    }
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Color(0xFFDDA512), Color(0xFFD4940F)],
                      ),
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xFFDDA512).withOpacity(0.3),
                          blurRadius: 15,
                          offset: Offset(0, 5),
                        ),
                      ],
                    ),
                    child: isLoading
                        ? SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(
                              valueColor:
                                  AlwaysStoppedAnimation<Color>(Colors.white),
                              strokeWidth: 2,
                            ),
                          )
                        : Text(
                            'Send Message',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String hint,
    required bool isDarkMode,
    int maxLines = 1,
    required String? Function(String?) validator,
  }) {
    return TextFormField(
      controller: controller,
      maxLines: maxLines,
      validator: validator,
      style: TextStyle(
        color: isDarkMode ? Colors.white : Colors.black87,
        fontSize: 14, // Reduced font size for input text
      ),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(
          color: isDarkMode ? Colors.grey[400] : Colors.grey[600],
          fontSize: 13, // Reduced font size for hint text
        ),
        filled: true,
        fillColor: isDarkMode ? Colors.grey[900] : Colors.grey[100],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
              color: Color(0xFFDDA512), width: 1.5), // Reduced border width
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide:
              BorderSide(color: Colors.red, width: 1.5), // Reduced border width
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide:
              BorderSide(color: Colors.red, width: 1.5), // Reduced border width
        ),
        isDense: true, // Makes the field more compact
        contentPadding: EdgeInsets.symmetric(
          horizontal: 16,
          vertical:
              maxLines > 1 ? 16 : 12, // Adjusted padding for single/multi line
        ),
      ),
    );
  }
}
