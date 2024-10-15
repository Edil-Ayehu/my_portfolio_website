import 'package:flutter/material.dart';
import 'package:flutter_portfolio_website/sections/skills_section.dart/widgets/skill_container.dart';
import 'package:flutter_portfolio_website/widgets/section_title.dart';

class SkillsSection extends StatelessWidget {
  final bool isMobile;
  const SkillsSection({
    super.key,
    this.isMobile = false,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(top: 26),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: size.width * 0.03),
          SectionTitle(title: 'Skill Set', isMobile: isMobile),
          SizedBox(height: size.width * 0.04),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: isMobile ? size.width * 0.08 : size.width * 0.02),
            child: isMobile
                ? Column(
                    children: [
                      SkillContainer(
                        skillName: 'Flutter',
                        percentage: 0.8,
                        imageUrl: 'assets/icons/flutter.png',
                        isMobile: true,
                      ),
                      SkillContainer(
                        skillName: 'Figma',
                        percentage: 0.6,
                        imageUrl: 'assets/icons/figma.png',
                        isMobile: true,
                      ),
                      SkillContainer(
                        skillName: 'React',
                        percentage: 0.7,
                        imageUrl: 'assets/icons/react.png',
                        isMobile: true,
                      ),
                      SkillContainer(
                        skillName: 'Tailwind CSS',
                        percentage: 0.65,
                        imageUrl: 'assets/icons/tailwind.png',
                        isMobile: true,
                      ),
                      SkillContainer(
                        skillName: 'HTML',
                        percentage: 0.85,
                        imageUrl: 'assets/icons/html.png',
                        isMobile: true,
                      ), 
                      SkillContainer(
                        skillName: 'CSS',
                        percentage: 0.8, 
                        imageUrl: 'assets/icons/css.png',
                        isMobile: true,
                      ),
                      SkillContainer(
                        skillName: 'JavaScript',
                        percentage: 0.7,
                        imageUrl: 'assets/icons/js.png',
                        isMobile: true,
                      ),
                    ],
                  )
                : Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          SkillContainer(
                            skillName: 'Flutter',
                            percentage: 0.8,
                            imageUrl: 'assets/icons/flutter.png',
                          ),
                          SkillContainer(
                            skillName: 'Figma',
                            percentage: 0.6,
                            imageUrl: 'assets/icons/figma.png',
                          ),
                          SkillContainer(
                            skillName: 'React',
                            percentage: 0.7,
                            imageUrl: 'assets/icons/react.png',
                          ),
                          SkillContainer(
                            skillName: 'Tailwind CSS',
                            percentage: 0.65,
                            imageUrl: 'assets/icons/tailwind.png',
                          ),
                        ],
                      ),
                      SizedBox(width: size.width * 0.04),
                      Column(
                        children: [
                          SkillContainer(
                            skillName: 'HTML',
                            percentage: 0.85,
                            imageUrl: 'assets/icons/html.png',
                          ),
                          SkillContainer(
                            skillName: 'CSS',
                            percentage: 0.8,
                            imageUrl: 'assets/icons/css.png',
                          ),
                          SkillContainer(
                            skillName: 'JavaScript',
                            percentage: 0.7,
                            imageUrl: 'assets/icons/js.png',
                          ),
                        ],
                      ),
                    ],
                  ),
          ),
          SizedBox(height: size.width * 0.04),
        ],
      ),
    );
  }
}
