import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  Future<void> _launchUrl(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isWide = width > 800;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1000),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _buildHeader(isWide),
                    const SizedBox(height: 48),
                    _buildAbout(),
                    const SizedBox(height: 40),
                    _buildSkills(),
                    const SizedBox(height: 40),
                    _buildProjects(),
                    const SizedBox(height: 40),
                    _buildEducation(),
                    const SizedBox(height: 40),
                    _buildContact(),
                    const SizedBox(height: 32),
                    Center(
                      child: Column(
                        children: [
                          Text(
                            'Designed & Developed by Safat Amit',
                            style: TextStyle(
                              color: Colors.grey.shade400,
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            '© ${DateTime.now().year} All Rights Reserved.',
                            style: TextStyle(
                              color: Colors.grey.shade600,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(bool isWide) {
    final avatar = Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: const Color(0xFF4F8DFD),
          width: 4,
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0x554F8DFD),
            blurRadius: 25,
            spreadRadius: 2,
          ),
        ],
      ),
      child: ClipOval(
        child: Image.asset(
          'assets/images/profile.jpeg',
          width: 160,
          height: 160,
          fit: BoxFit.cover,
        ),
      ),
    );

    final textBlock = Column(
      crossAxisAlignment:
          isWide ? CrossAxisAlignment.start : CrossAxisAlignment.center,
      children: [
        const Text(
          'Safat Bin Mannan',
          style: TextStyle(
            fontSize: 34,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 8),
        Text(
          'Aspiring Software Engineer',
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey.shade400,
          ),
          textAlign: isWide ? TextAlign.left : TextAlign.center,
        ),
        const SizedBox(height: 4),
        Text(
          'Flutter & React Developer',
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey.shade500,
            fontWeight: FontWeight.w500,
          ),
          textAlign: isWide ? TextAlign.left : TextAlign.center,
        ),
        const SizedBox(height: 4),
        Text(
          'International Islamic University Chittagong',
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey.shade500,
          ),
          textAlign: isWide ? TextAlign.left : TextAlign.center,
        ),
        const SizedBox(height: 16),
        Wrap(
          alignment: isWide ? WrapAlignment.start : WrapAlignment.center,
          spacing: 12,
          runSpacing: 12,
          children: [
            ElevatedButton.icon(
              onPressed: () => _launchUrl('mailto:safatamit@gmail.com'),
              icon: const Icon(Icons.email_outlined, size: 18),
              label: const Text('Contact Me'),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF4F8DFD),
                foregroundColor: Colors.white,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
              ),
            ),
            OutlinedButton.icon(
              onPressed: () => _launchUrl('https://github.com/SaFat130'),
              icon: const Icon(Icons.code, size: 18),
              label: const Text('GitHub'),
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.white,
                side: BorderSide(color: Colors.grey.shade600),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
              ),
            ),
            OutlinedButton.icon(
              onPressed: () => _launchUrl(
                  'https://drive.google.com/file/d/YOUR_CV_LINK/view'),
              icon: const Icon(Icons.description_outlined, size: 18),
              label: const Text('Resume'),
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.white,
                side: BorderSide(color: Colors.grey.shade600),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ],
        ),
      ],
    );

    if (isWide) {
      return Row(
        children: [
          avatar,
          const SizedBox(width: 32),
          Expanded(child: textBlock),
        ],
      );
    }

    return Column(
      children: [
        avatar,
        const SizedBox(height: 20),
        textBlock,
      ],
    );
  }

  Widget _sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        children: [
          Container(
            width: 6,
            height: 24,
            decoration: BoxDecoration(
              color: const Color(0xFF4F8DFD),
              borderRadius: BorderRadius.circular(3),
            ),
          ),
          const SizedBox(width: 12),
          Text(
            title,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget _card({required Widget child}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF181B21),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.grey.shade900),
      ),
      child: child,
    );
  }

  Widget _buildAbout() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _sectionTitle('About Me'),
        _card(
          child: Text(
            'I\'m Safat Amit, a Computer Science and Engineering student with a '
            'strong passion for software development and problem-solving. My goal '
            'is to become a Software Engineer and build impactful applications that '
            'solve real-world problems. I have experience with C, C++, HTML, CSS, '
            'JavaScript, React.js, and I\'m currently learning Flutter to expand my '
            'mobile development skills. I enjoy building responsive applications, '
            'writing clean and maintainable code, and continuously learning new '
            'technologies to grow as a developer.',
            style: TextStyle(
              fontSize: 15,
              height: 1.7,
              color: Colors.grey.shade300,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSkills() {
    final skills = [
      'C',
      'C++',
      'HTML',
      'CSS',
      'JavaScript',
      'React.js',
      'Flutter',
      'Dart',
      'Git',
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _sectionTitle('Tech Stack'),
        _card(
          child: Wrap(
            spacing: 12,
            runSpacing: 12,
            children: skills.map((skill) {
              return Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFF222831),
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(
                    color: Color(0x664F8DFD),
                  ),
                ),
                child: Text(
                  skill,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }

  Widget _buildProjects() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _sectionTitle('Projects'),
        Column(
          children: [
            _projectCard(
              title: 'Flutter Portfolio',
              tech: 'Flutter • Dart',
              description:
                  'A responsive personal portfolio built with Flutter, featuring a modern dark UI, adaptive layout, and interactive contact integration.',
            ),
            const SizedBox(height: 16),
            _projectCard(
              title: 'News Portal',
              tech: 'React • Node.js • JWT',
              description:
                  'A premium news platform with secure authentication, job circulars, premium content access, and user account management.',
            ),
            const SizedBox(height: 16),
            _projectCard(
              title: 'Exam Management System',
              tech: 'PHP • MySQL',
              description:
                  'A database-driven application for managing examinations, students, results, and administrative operations efficiently.',
            ),
          ],
        ),
      ],
    );
  }

  Widget _projectCard({
    required String title,
    required String tech,
    required String description,
  }) {
    return _card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            tech,
            style: const TextStyle(
              color: Color(0xFF4F8DFD),
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            description,
            style: TextStyle(
              color: Colors.grey.shade300,
              height: 1.6,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEducation() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _sectionTitle('Education'),
        _card(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(Icons.school_outlined,
                  color: Color(0xFF4F8DFD), size: 28),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Bachelor of Science in Computer Science & Engineering',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'International Islamic University Chittagong',
                      style: TextStyle(
                        color: Colors.grey.shade300,
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Expected Graduation: 2028',
                      style: TextStyle(
                        color: Colors.grey.shade400,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      'Feni, Bangladesh',
                      style: TextStyle(
                        color: Colors.grey.shade500,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildContact() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _sectionTitle('Contact'),
        _card(
          child: Column(
            children: [
              _contactRow(
                Icons.email_outlined,
                'safatamit@gmail.com',
                () => _launchUrl('mailto:safatamit@gmail.com'),
              ),
              const Divider(color: Colors.white12, height: 24),
              _contactRow(
                Icons.code,
                'github.com/SaFat130',
                () => _launchUrl('https://github.com/SaFat130'),
              ),
              const Divider(color: Colors.white12, height: 24),
              _contactRow(
                Icons.location_on_outlined,
                'Feni, Bangladesh',
                null,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _contactRow(IconData icon, String text, VoidCallback? onTap) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Row(
          children: [
            Icon(icon, color: const Color(0xFF4F8DFD), size: 20),
            const SizedBox(width: 14),
            Text(
              text,
              style: TextStyle(
                color: Colors.grey.shade300,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
