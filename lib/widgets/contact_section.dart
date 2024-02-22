import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:my_portfolio/constants/custom_colors.dart';
import 'package:my_portfolio/constants/custom_size.dart';
import 'package:my_portfolio/constants/height_width.dart';
import 'package:my_portfolio/constants/sms_links.dart';
import 'package:my_portfolio/widgets/custom_text_field_widget.dart';
import 'package:http/http.dart' as http;
// ignore: avoid_web_libraries_in_flutter
import 'dart:js' as js;

class ContactSection extends StatefulWidget {
  const ContactSection({super.key});

  @override
  State<ContactSection> createState() => _ContactSectionState();
}

class _ContactSectionState extends State<ContactSection> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController messageController = TextEditingController();
  bool isLodaing = false;
  Text? statusText;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32).copyWith(bottom: 80),
      width: double.infinity,
      color: CustomColors.bgLight1,
      child: Column(
        children: [
          //Title
          const Text(
            "Get in touch",
            style: TextStyle(
              color: CustomColors.whitePrimary,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          Heightwidth.hight40,
          ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 700,
            ),
            child: LayoutBuilder(
              builder: (context, constraints) {
                if (constraints.maxWidth >= CustomSize.minDesktopWidth) {
                  return builNameEmailFieldDesktop(
                    nameController: nameController,
                    emailController: emailController,
                  );
                }
                return builNameEmailFieldMobile(
                  nameController: nameController,
                  emailController: emailController,
                );
              },
            ),
          ),

          Heightwidth.hight15,
          // Message
          ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 700,
            ),
            child: CustomTextFieldWidget(
              controller: messageController,
              hintText: "Your Message...",
              maxLines: 16,
            ),
          ),

          Heightwidth.hight20,
          // Send Button
          ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 700,
            ),
            child: Row(
              children: [
                SizedBox(
                  height: 40,
                  width: 200,
                  child: ElevatedButton(
                    onPressed: () async {
                      statusText = await sendEmail(
                        name: nameController.text,
                        email: emailController.text,
                        message: messageController.text,
                      );
                      setState(() {});
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: CustomColors.yellowPrimay,
                    ),
                    child: const Text(
                      "Get in touch",
                      style: TextStyle(
                        color: CustomColors.whitePrimary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Heightwidth.width15,
                if (statusText != null) statusText! else if (isLodaing) const CircularProgressIndicator(),
              ],
            ),
          ),

          ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 500,
            ),
            child: const Padding(
              padding: EdgeInsets.only(top: 30, bottom: 16),
              child: Divider(),
            ),
          ),
          // SMS icon buttons link
          Wrap(
            spacing: 12,
            runSpacing: 12,
            alignment: WrapAlignment.center,
            children: [
              // linkedin
              InkWell(
                onTap: () {
                  js.context.callMethod('open', [SmsLinks.linkedin]);
                },
                child: Image.asset("assets/social_media/linkedin_icon.png", width: 28),
              ),
              // Instagram
              InkWell(
                onTap: () {
                  js.context.callMethod('open', [SmsLinks.instagram]);
                },
                child: Image.asset("assets/social_media/instagram_icon.png", width: 28),
              ),
              // GitHub
              InkWell(
                onTap: () {
                  js.context.callMethod('open', [SmsLinks.github]);
                },
                child: Image.asset("assets/social_media/github_icon.png", width: 28),
              ),
              // Facebook
              InkWell(
                onTap: () {
                  js.context.callMethod('open', [SmsLinks.facebook]);
                },
                child: Image.asset("assets/social_media/facebook_icon.png", width: 28),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Row builNameEmailFieldDesktop({
    required TextEditingController nameController,
    required TextEditingController emailController,
  }) {
    return Row(
      children: [
        // Name
        Flexible(
          child: CustomTextFieldWidget(
            controller: nameController,
            hintText: "Your Name",
          ),
        ),

        Heightwidth.width15,
        // Email
        Flexible(
          child: CustomTextFieldWidget(
            controller: emailController,
            hintText: "Your Email",
          ),
        ),
      ],
    );
  }

  Column builNameEmailFieldMobile({
    required TextEditingController nameController,
    required TextEditingController emailController,
  }) {
    return Column(
      children: [
        // Name
        CustomTextFieldWidget(
          controller: nameController,
          hintText: "Your Name",
        ),

        Heightwidth.hight10,
        // Email
        CustomTextFieldWidget(
          controller: emailController,
          hintText: "Your Email",
        ),
      ],
    );
  }

  Future<Text> sendEmail({required String name, required String email, required String message}) async {
    if (name.isEmpty || email.isEmpty || message.isEmpty) {
      return const Text(
        "Fields are required!",
        style: TextStyle(
          color: Colors.red,
          fontSize: 12,
          fontWeight: FontWeight.w400,
        ),
      );
    }

    setState(() {
      isLodaing = true;
    });

    final url = Uri.parse("https://api.emailjs.com/api/v1.0/email/send");
    const serviceId = 'service_v3u5uyn';
    const templateId = 'template_sm63zhd';
    const userId = 'naRFjgTLJMUrigc3g';
    final response = await http.post(url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'service_id': serviceId,
          'template_id': templateId,
          'user_id': userId,
          'template_params': {
            'name': name,
            'subject': '',
            'message': message,
            'user_email': email,
          }
        }));

    setState(() {
      isLodaing = false;
    });

    if (response.statusCode == 200 || response.statusCode == 201) {
      nameController.clear();
      emailController.clear();
      messageController.clear();

      return const Text(
        "Submitted Successfully.",
        style: TextStyle(
          color: Colors.green,
          fontSize: 12,
          fontWeight: FontWeight.w400,
        ),
      );
    }

    return const Text(
      "Try after some time.",
      style: TextStyle(
        color: Colors.red,
        fontSize: 12,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}
