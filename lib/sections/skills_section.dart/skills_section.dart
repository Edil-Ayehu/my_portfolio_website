import 'package:flutter/material.dart';
import 'package:flutter_portfolio_website/sections/skills_section.dart/widgets/skill_container.dart';

class SkillsSection extends StatelessWidget {
  final bool isMobile;
  const SkillsSection({
    super.key,
    this.isMobile = false,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        vertical: size.height * 0.05,
        horizontal: isMobile ? 20 : size.width * 0.1,
      ),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: isDarkMode 
              ? [Color(0xFF1A1A1A), Color(0xFF262626)]
              : [Color(0xFFF5F5F5), Color(0xFFE8E8E8)],
        ),
      ),
      child: Column(
        children: [
          Text(
            'MY SKILLS',
            style: TextStyle(
              fontSize: isMobile ? 14 : 16,
              fontWeight: FontWeight.w600,
              letterSpacing: 3,
              color: Color(0xFFDDA512),
            ),
          ),
          SizedBox(height: 12),
          Text(
            'Technical Expertise',
            style: TextStyle(
              fontSize: isMobile ? 28 : 36,
              fontWeight: FontWeight.bold,
              letterSpacing: 1,
            ),
          ),
          SizedBox(height: size.height * 0.05),
          Wrap(
            spacing: 20,
            runSpacing: 20,
            alignment: WrapAlignment.center,
            children: [
              _buildSkillGroup(
                context,
                title: "Frontend Development",
                skills: [
                  SkillData('Flutter', 0.8, 'assets/icons/flutter.png'),
                  SkillData('React', 0.7, 'assets/icons/react.png'),
                  SkillData('HTML', 0.85, 'assets/icons/html.png'),
                  SkillData('CSS', 0.8, 'assets/icons/css.png'),
                ],
                isMobile: isMobile,
              ),
              _buildSkillGroup(
                context,
                title: "Design & Others",
                skills: [
                  SkillData('Figma', 0.6, 'assets/icons/figma.png'),
                  SkillData('JavaScript', 0.7, 'assets/icons/js.png'),
                  SkillData('Tailwind CSS', 0.65, 'assets/icons/tailwind.png'),
                ],
                isMobile: isMobile,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSkillGroup(
    BuildContext context, {
    required String title,
    required List<SkillData> skills,
    required bool isMobile,
  }) {
    return Container(
      width: isMobile ? double.infinity : 500,
      padding: EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Theme.of(context).brightness == Brightness.dark
            ? Colors.grey[850]
            : Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 20,
            offset: Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: isMobile ? 20 : 24,
              fontWeight: FontWeight.bold,
              color: Color(0xFFDDA512),
            ),
          ),
          SizedBox(height: 20),
          ...skills.map((skill) => Padding(
                padding: EdgeInsets.only(bottom: 16),
                child: SkillContainer(
                  skillName: skill.name,
                  percentage: skill.percentage,
                  imageUrl: skill.imageUrl,
                  isMobile: isMobile,
                ),
              )),
        ],
      ),
    );
  }
}

class SkillData {
  final String name;
  final double percentage;
  final String imageUrl;

  SkillData(this.name, this.percentage, this.imageUrl);
}
