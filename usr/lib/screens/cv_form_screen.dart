import 'package:flutter/material.dart';
import '../models/cv_data.dart';
import 'cv_preview_screen.dart';

class CVFormScreen extends StatefulWidget {
  const CVFormScreen({super.key});

  @override
  State<CVFormScreen> createState() => _CVFormScreenState();
}

class _CVFormScreenState extends State<CVFormScreen> {
  final _formKey = GlobalKey<FormState>();
  
  // Pre-filled with dummy data for demonstration purposes
  final CVData _cvData = CVData(
    fullName: 'Alex Johnson',
    email: 'alex.johnson@email.com',
    phone: '+1 (555) 019-8273',
    location: 'San Francisco, CA',
    linkedin: 'linkedin.com/in/alexjohnson',
    summary: 'Results-driven professional with 5+ years of experience delivering high-impact solutions. Proven track record in optimizing processes, leading cross-functional teams, and exceeding performance metrics. Adept at leveraging analytical skills to drive operational efficiency and business growth.',
    coreSkills: '• Project Management\n• Data Analysis\n• Strategic Planning\n• Agile Methodologies\n• Cross-functional Leadership',
    experience: 'Senior Project Manager – Tech Innovations Inc. – Jan 2020 to Present\n• Spearheaded the delivery of 15+ enterprise projects, increasing overall efficiency by 30%.\n• Managed a cross-functional team of 12 members, reducing project turnaround time by 20%.\n• Implemented new tracking systems that improved reporting accuracy by 45%.\n\nOperations Analyst – Global Solutions LLC – Jun 2016 to Dec 2019\n• Analyzed operational workflows to identify bottlenecks, saving the company \$50,000 annually.\n• Collaborated with IT to deploy a new CRM system across 3 regional offices.',
    education: 'Master of Business Administration (MBA)\nUniversity of California, Berkeley – Graduated May 2016\n\nBachelor of Science in Economics\nState University – Graduated May 2014',
    technicalSkills: 'Software: Jira, Salesforce, Tableau, Microsoft Office Suite\nMethodologies: Scrum, Kanban, Lean Six Sigma',
    languages: 'English (Native), Spanish (Professional Working Proficiency)',
  );

  Widget _buildTextField(String label, String initialValue, Function(String?) onSaved, {int maxLines = 1}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: TextFormField(
        initialValue: initialValue,
        decoration: InputDecoration(
          labelText: label,
          alignLabelWithHint: maxLines > 1,
        ),
        maxLines: maxLines,
        onSaved: onSaved,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter $label';
          }
          return null;
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ATS CV Builder Details'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(24.0),
          children: [
            const Text('Personal Information', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            _buildTextField('Full Name', _cvData.fullName, (val) => _cvData.fullName = val!),
            _buildTextField('Email', _cvData.email, (val) => _cvData.email = val!),
            _buildTextField('Phone', _cvData.phone, (val) => _cvData.phone = val!),
            _buildTextField('Location', _cvData.location, (val) => _cvData.location = val!),
            _buildTextField('LinkedIn', _cvData.linkedin, (val) => _cvData.linkedin = val!),
            
            const Divider(height: 48),
            const Text('Professional Summary', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            _buildTextField('Summary (3-4 lines)', _cvData.summary, (val) => _cvData.summary = val!, maxLines: 4),

            const Divider(height: 48),
            const Text('Core Skills', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            _buildTextField('Skills (Bullet points)', _cvData.coreSkills, (val) => _cvData.coreSkills = val!, maxLines: 4),

            const Divider(height: 48),
            const Text('Work Experience', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            _buildTextField('Experience (Title - Company - Dates\\n• Achievements)', _cvData.experience, (val) => _cvData.experience = val!, maxLines: 8),

            const Divider(height: 48),
            const Text('Education', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            _buildTextField('Education Details', _cvData.education, (val) => _cvData.education = val!, maxLines: 4),

            const Divider(height: 48),
            const Text('Additional Information', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            _buildTextField('Technical Skills', _cvData.technicalSkills, (val) => _cvData.technicalSkills = val!, maxLines: 3),
            _buildTextField('Languages', _cvData.languages, (val) => _cvData.languages = val!, maxLines: 2),

            const SizedBox(height: 32),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
                backgroundColor: Theme.of(context).colorScheme.primary,
                foregroundColor: Theme.of(context).colorScheme.onPrimary,
              ),
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CVPreviewScreen(cvData: _cvData),
                    ),
                  );
                }
              },
              child: const Text('Generate ATS-Optimized CV', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}
