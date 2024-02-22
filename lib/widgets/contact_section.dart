import 'package:flutter/material.dart';
import 'package:my_portfolio/constants/custom_colors.dart';
import 'package:my_portfolio/constants/custom_size.dart';
import 'package:my_portfolio/constants/height_width.dart';
import 'package:my_portfolio/constants/sms_links.dart';
import 'package:my_portfolio/widgets/custom_text_field_widget.dart';
// ignore: avoid_web_libraries_in_flutter
import 'dart:js' as js;

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController messageController = TextEditingController();
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
            child: Align(
              alignment: Alignment.centerLeft,
              child: SizedBox(
                height: 40,
                width: 200,
                child: ElevatedButton(
                  onPressed: () {},
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
}
