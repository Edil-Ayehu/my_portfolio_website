import 'package:flutter/material.dart';
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
      content: Text(
        message,
        style: TextStyle(color: Colors.white),
      ),
      backgroundColor: color,
      behavior: SnackBarBehavior.floating,
      width: MediaQuery.of(context).size.width * 0.6,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(34),
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  // Email validation function
  bool isValidEmail(String email) {
    // Regex pattern for validating email
    String pattern = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
    RegExp regex = RegExp(pattern);
    return regex.hasMatch(email);
  }

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final size = MediaQuery.of(context).size;

    return Card(
      elevation: 10,
      color: isDarkMode ? Color(0xFF131414) : Color(0xFfE6E6E6),
      child: Container(
        padding: EdgeInsets.only(left: 25, right: 25, top: 20, bottom: 10),
        height: widget.isMobile
            ? size.height * 0.52
            : (size.height > 1100 ? size.width * 0.4 : size.width * 0.36),
        decoration: BoxDecoration(
          color: isDarkMode ? Color(0xFF131414) : Color(0xFFE6E6E6),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: Color(0xFFE6E6E6),
            width: 0.5,
          ),
        ),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  'Send me a Message',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontSize: 24,
                      ),
                ),
              ),
              SizedBox(height: widget.isMobile ? 15 : 30),
              Row(
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: TextFormField(
                        controller: fullNameEditingController,
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .copyWith(color: Color(0xFF131414)),
                        cursorColor: Colors.grey.shade800,
                        decoration: InputDecoration(
                          hintText: 'Full name',
                          hintStyle:
                              Theme.of(context).textTheme.bodySmall!.copyWith(
                                    color: isDarkMode
                                        ? Color(0xFF131414)
                                        : Color(0xFFE6E6E6),
                                  ),
                          errorStyle: TextStyle(
                            color: Colors.red, // Customize error message color
                            fontSize: 12.0, // Customize font size
                            fontWeight:
                                FontWeight.bold, // Customize font weight
                          ),
                          fillColor: isDarkMode
                              ? Color(0xFFE6E6E6)
                              : Color.fromARGB(255, 174, 174, 174),
                          filled: true,
                          border: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Full name is required';
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: TextFormField(
                        controller: emailEditingController,
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .copyWith(color: Color(0xFF131414)),
                        cursorColor: Colors.grey.shade800,
                        decoration: InputDecoration(
                          hintText: 'Your email',
                          hintStyle:
                              Theme.of(context).textTheme.bodySmall!.copyWith(
                                    color: isDarkMode
                                        ? Color(0xFF131414)
                                        : Color(0xFFE6E6E6),
                                  ),
                          errorStyle: TextStyle(
                            color: Colors.red, // Customize error message color
                            fontSize: 12.0, // Customize font size
                            fontWeight:
                                FontWeight.bold, // Customize font weight
                          ),
                          fillColor: isDarkMode
                              ? Color(0xFFE6E6E6)
                              : Color.fromARGB(255, 174, 174, 174),
                          filled: true,
                          border: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Email is required';
                          } else if (!isValidEmail(value)) {
                            return 'Enter a valid email address';
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15),
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: TextFormField(
                  controller: subjectEditingController,
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(color: Color(0xFF131414)),
                  cursorColor: Colors.grey.shade800,
                  decoration: InputDecoration(
                    hintText: 'Subject',
                    hintStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: isDarkMode
                              ? Color(0xFF131414)
                              : Color(0xFFE6E6E6),
                        ),
                    fillColor: isDarkMode
                        ? Color(0xFFE6E6E6)
                        : Color.fromARGB(255, 174, 174, 174),
                    filled: true,
                    border: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(height: 15),
              SizedBox(
                height: widget.isMobile ? size.height * 0.1 : size.width * 0.06,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: TextFormField(
                    controller: messageEditingController,
                    maxLines: null, // Enables multiline input
                    expands:
                        true, // Allows the TextField to expand to the parent's height
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(color: Color(0xFF131414)),

                    cursorColor: Colors.grey.shade800,
                    decoration: InputDecoration(
                      hintText: 'Message...',
                      hintStyle:
                          Theme.of(context).textTheme.bodySmall!.copyWith(
                                color: isDarkMode
                                    ? Color(0xFF131414)
                                    : Color(0xFFE6E6E6),
                              ),
                      errorStyle: TextStyle(
                        color: Colors.red, // Customize error message color
                        fontSize: 12.0, // Customize font size
                        fontWeight: FontWeight.bold, // Customize font weight
                      ),
                      fillColor: isDarkMode
                          ? Color(0xFFE6E6E6)
                          : Color.fromARGB(255, 174, 174, 174),
                      filled: true,
                      border: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Message is required';
                      }
                      return null;
                    },
                  ),
                ),
              ),
              Spacer(),
              Align(
                alignment: Alignment.bottomRight,
                child: MouseRegion(
                  cursor: SystemMouseCursors
                      .click, // Change cursor to pointer on hover
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

                          // Clear the form fields
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
                      height: widget.isMobile ? 40 : 50,
                      width: 160,
                      decoration: BoxDecoration(
                          color: isDarkMode
                              ? Color(0xFF131414)
                              : Color(0xFFDDA512),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            width: 1,
                            color: isDarkMode
                                ? Color(0xFFe6e6e6)
                                : Color(0xFFDDA512),
                          )),
                      alignment: Alignment.center,
                      child: isLoading
                          ? CircularProgressIndicator(
                              valueColor:
                                  AlwaysStoppedAnimation<Color>(Colors.white),
                            )
                          : Text(
                              'Send',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                    ),
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
