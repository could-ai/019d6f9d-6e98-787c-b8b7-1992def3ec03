import 'package:flutter/material.dart';
import '../models/cv_data.dart';

class CVPreviewScreen extends StatelessWidget {
  final CVData cvData;

  const CVPreviewScreen({super.key, required this.cvData});

  Widget _buildSectionTitle(String title) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),
        Text(
          title.toUpperCase(),
          style: const TextStyle(
            fontSize: 14, 
            fontWeight: FontWeight.bold, 
            letterSpacing: 1.2,
            color: Colors.black,
          ),
        ),
        const Divider(color: Colors.black, thickness: 1.5, height: 12),
        const SizedBox(height: 8),
      ],
    );
  }

  Widget _buildText(String text, {bool isBold = false, double fontSize = 12}) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
        color: Colors.black87,
        height: 1.5,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ATS CV Preview'),
        backgroundColor: Colors.blueGrey,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.download),
            tooltip: 'Export PDF (Mock)',
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('PDF Export functionality would trigger here.')),
              );
            },
          ),
        ],
      ),
      body: Container(
        color: Colors.grey.shade200,
        alignment: Alignment.topCenter,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Container(
            constraints: const BoxConstraints(maxWidth: 800),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            padding: const EdgeInsets.symmetric(horizontal: 48.0, vertical: 64.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header
                Center(
                  child: Text(
                    cvData.fullName.toUpperCase(),
                    style: const TextStyle(
                      fontSize: 24, 
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      letterSpacing: 1.5,
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                Center(
                  child: Text(
                    '${cvData.location} | ${cvData.phone} | ${cvData.email}\n${cvData.linkedin}',
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 12, color: Colors.black87, height: 1.5),
                  ),
                ),
                const SizedBox(height: 8),

                // Professional Summary
                if (cvData.summary.isNotEmpty) ...[
                  _buildSectionTitle('Professional Summary'),
                  _buildText(cvData.summary),
                ],

                // Core Skills
                if (cvData.coreSkills.isNotEmpty) ...[
                  _buildSectionTitle('Core Skills'),
                  _buildText(cvData.coreSkills),
                ],

                // Work Experience
                if (cvData.experience.isNotEmpty) ...[
                  _buildSectionTitle('Professional Experience'),
                  _buildText(cvData.experience),
                ],

                // Education
                if (cvData.education.isNotEmpty) ...[
                  _buildSectionTitle('Education'),
                  _buildText(cvData.education),
                ],

                // Technical Skills
                if (cvData.technicalSkills.isNotEmpty) ...[
                  _buildSectionTitle('Technical Skills'),
                  _buildText(cvData.technicalSkills),
                ],

                // Languages
                if (cvData.languages.isNotEmpty) ...[
                  _buildSectionTitle('Languages'),
                  _buildText(cvData.languages),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
