import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PrivacyPolicyDialog {
  void show(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Privacy Policy'),
          content: SingleChildScrollView(
            child: Text(
              '''
Privacy Policy
Last updated: November 12, 2022

This Privacy Policy ("Policy") outlines the policies and procedures regarding the collection, use, and disclosure of your information when using our SmartCheck application ("Service"). Please read this Policy carefully to understand how we handle your data.

Information We Collect:
1. Personal Data: When you use our Service, we may collect personally identifiable information, including your first and last name.
2. Usage Data: We automatically collect information such as your device's Internet Protocol (IP) address, browser type, pages visited, and other diagnostic data.

How We Use Your Information:
We use your information for various purposes, including:
- Providing and improving the Service.
- Managing your account and registration.
- Contacting you for updates and communications.
- Performing data analysis to enhance our Service, products, and marketing.

Sharing Your Information:
We may share your personal information in the following situations:
- With Service Providers: to monitor and analyze the use of our Service.
- In business transactions: during mergers, acquisitions, or transfers of our business.
- With Affiliates: to honor this Privacy Policy.
- With business partners: to offer you products, services, or promotions.
- With other users: when you share information in public areas.

Security of Your Information:
While we implement security measures, no method of transmission over the Internet is 100% secure. We strive to protect your personal data, but we cannot guarantee absolute security.

Children's Privacy:
Our Service is not intended for individuals under the age of 13. We do not knowingly collect personal information from children. If we become aware of such data, we take steps to remove it.

Links to Other Websites:
Our Service may contain links to third-party websites. We are not responsible for the content or privacy practices of these sites. Please review their policies.

Changes to this Privacy Policy:
We may update this Policy to reflect changes in our practices. We will notify you of significant changes. Please review this Policy periodically.

Contact Us:
If you have questions or concerns about this Privacy Policy, contact us at nu.smartcheck@gmail.com.
              ''',
              style: GoogleFonts.nunito(),
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }
}
