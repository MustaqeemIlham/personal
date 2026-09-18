import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:flutter_staggered_animations/animation_configuration.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
// flutter_map integration removed in this refactored placeholder version.
// The full interactive map will be reintroduced once flutter_map API
// compatibility is resolved.
import '../app/theme/app_colors.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import '../app/theme/app_theme.dart';
import '../shared/widgets/editorial_header.dart';
import '../shared/widgets/editorial_section_header.dart';
import '../shared/widgets/thin_divider.dart';
import '../shared/widgets/social_icon_button.dart';
// removed: project_card import is unused after editorial refactor
import '../shared/widgets/project_entry.dart';
import '../data/portfolio_data.dart';
import '../shared/widgets/contact_info.dart';
import '../shared/widgets/content_container.dart';
import '../shared/widgets/site_nav.dart';
import '../shared/widgets/site_footer.dart';
import '../shared/widgets/skill_group.dart';
import '../shared/widgets/education_entry.dart';

// Legacy entrypoint removed — use the new `lib/main.dart` runner.
void legacyMain() {}

class MyPortfolio extends StatelessWidget {
  const MyPortfolio({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ilham Mustaqeem - AI Developer',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      initialRoute: '/',
      routes: {
        '/': (context) => const PortfolioHomePage(),
        '/personal': (context) => const PersonalSitePage(),
      },
    );
  }
}

class _TravelStoryCard extends StatelessWidget {
  final String title;
  final String date;
  final String summary;

  const _TravelStoryCard({required this.title, required this.date, required this.summary});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        border: Border.all(color: AppColors.border),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: Theme.of(context).textTheme.titleSmall?.copyWith(color: AppColors.charcoal, fontWeight: FontWeight.w700)),
          const SizedBox(height: 6),
          Text(date, style: Theme.of(context).textTheme.bodySmall?.copyWith(color: AppColors.textSecondary)),
          const SizedBox(height: 10),
          Text(summary, style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: AppColors.textPrimary, height: 1.6)),
          const SizedBox(height: 12),
          Row(
            children: [
              Text('READ →', style: Theme.of(context).textTheme.labelLarge?.copyWith(color: AppColors.accent, fontWeight: FontWeight.w700)),
            ],
          ),
        ],
      ),
    );
  }
}

class PortfolioHomePage extends StatefulWidget {
  const PortfolioHomePage({super.key});

  @override
  State<PortfolioHomePage> createState() => _PortfolioHomePageState();
}

class _PortfolioHomePageState extends State<PortfolioHomePage> {
  final ScrollController _scrollController = ScrollController();
  final GlobalKey _aboutKey = GlobalKey();
  final GlobalKey _skillsKey = GlobalKey();
  final GlobalKey _educationKey = GlobalKey();
  final GlobalKey _projectsKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();

  void _scrollToSection(GlobalKey key) {
    final targetContext = key.currentContext;
    if (targetContext != null) {
      Scrollable.ensureVisible(
        targetContext,
        duration: const Duration(milliseconds: 450),
        curve: Curves.easeInOut,
        alignment: 0.04,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Small, understated site header (name + short intro + page switch)
            EditorialHeader(
              handle: 'NOMADMUSTAQEEM',
              name: 'Ilham Mustaqeem',
              subtitle: 'AI & Software Developer',
              statusLine: 'AI Developer • Open to projects',
              onPortfolioTap: () {},
              onPersonalTap: () {
                Navigator.pushNamed(context, '/personal');
              },
            ),
            // In-page text navigation
            SiteNav(
              items: [
                SiteNavItem(label: 'About', onTap: () => _scrollToSection(_aboutKey)),
                SiteNavItem(label: 'Skills', onTap: () => _scrollToSection(_skillsKey)),
                SiteNavItem(label: 'Education', onTap: () => _scrollToSection(_educationKey)),
                SiteNavItem(label: 'Projects', onTap: () => _scrollToSection(_projectsKey)),
                SiteNavItem(label: 'Contact', onTap: () => _scrollToSection(_contactKey)),
              ],
            ),

            // Compact introduction — no large hero, just a short greeting block
            ContentContainer(
              verticalPadding: const EdgeInsets.symmetric(vertical: 36),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hi, the name\'s',
                          style: GoogleFonts.notoSansJp(
                            fontSize: 14,
                            color: AppColors.textSecondary,
                            letterSpacing: 0.4,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          'Ilham Mustaqeem',
                          style: GoogleFonts.notoSerifJp(
                            fontSize: 30,
                            fontWeight: FontWeight.w700,
                            color: AppColors.charcoal,
                            height: 1.1,
                          ),
                        ),
                        const SizedBox(height: 10),
                        SizedBox(
                          height: 24,
                          child: AnimatedTextKit(
                            animatedTexts: [
                              TypewriterAnimatedText(
                                'AI & Software Developer',
                                textStyle: GoogleFonts.notoSansJp(fontSize: 15, color: AppColors.textSecondary, fontWeight: FontWeight.w600),
                                speed: const Duration(milliseconds: 100),
                              ),
                              TypewriterAnimatedText(
                                'Try Every Sport',
                                textStyle: GoogleFonts.notoSansJp(fontSize: 15, color: AppColors.textSecondary, fontWeight: FontWeight.w600),
                                speed: const Duration(milliseconds: 100),
                              ),
                              TypewriterAnimatedText(
                                'Big Fan of Money',
                                textStyle: GoogleFonts.notoSansJp(fontSize: 15, color: AppColors.textSecondary, fontWeight: FontWeight.w600),
                                speed: const Duration(milliseconds: 100),
                              ),
                              TypewriterAnimatedText(
                                'Bikepacking & Backpacking Explorer',
                                textStyle: GoogleFonts.notoSansJp(fontSize: 15, color: AppColors.textSecondary, fontWeight: FontWeight.w600),
                                speed: const Duration(milliseconds: 100),
                              ),
                              TypewriterAnimatedText(
                                'Solo Travel',
                                textStyle: GoogleFonts.notoSansJp(fontSize: 15, color: AppColors.textSecondary, fontWeight: FontWeight.w600),
                                speed: const Duration(milliseconds: 100),
                              ),
                              TypewriterAnimatedText(
                                'Runner & Trail Runner',
                                textStyle: GoogleFonts.notoSansJp(fontSize: 15, color: AppColors.textSecondary, fontWeight: FontWeight.w600),
                                speed: const Duration(milliseconds: 100),
                              ),
                              TypewriterAnimatedText(
                                'Surfing Adventurer',
                                textStyle: GoogleFonts.notoSansJp(fontSize: 15, color: AppColors.textSecondary, fontWeight: FontWeight.w600),
                                speed: const Duration(milliseconds: 100),
                              ),
                              TypewriterAnimatedText(
                                'Mobile & Web Application Developer',
                                textStyle: GoogleFonts.notoSansJp(fontSize: 15, color: AppColors.textSecondary, fontWeight: FontWeight.w600),
                                speed: const Duration(milliseconds: 100),
                              ),
                              TypewriterAnimatedText(
                                'Data Analytics Enthusiast',
                                textStyle: GoogleFonts.notoSansJp(fontSize: 15, color: AppColors.textSecondary, fontWeight: FontWeight.w600),
                                speed: const Duration(milliseconds: 100),
                              ),
                            ],
                            totalRepeatCount: 100,
                            pause: const Duration(milliseconds: 2000),
                            displayFullTextOnTap: true,
                            stopPauseOnTap: true,
                          ),
                        ),
                        const SizedBox(height: 18),
                        Wrap(
                          spacing: 12,
                          runSpacing: 8,
                          children: [
                            SocialIconButton(icon: FontAwesomeIcons.github, url: 'https://github.com/ilham-mustaqeem', color: const Color(0xFF1F2937)),
                            SocialIconButton(icon: FontAwesomeIcons.linkedin, url: 'https://www.linkedin.com/in/ilham-mustaqeem-130797269/', color: const Color(0xFF2563EB)),
                            SocialIconButton(icon: FontAwesomeIcons.instagram, url: 'https://www.instagram.com/mustaqeyym?igsh=MTNrZDM3NjB5ZTZzZg%3D%3D&utm_source=qr', color: const Color(0xFFE4405F)),
                            SocialIconButton(icon: FontAwesomeIcons.youtube, url: 'https://youtube.com/@mustnomad?si=sXfdFmEkofJTcfQh', color: const Color(0xFFFF0000)),
                            SocialIconButton(icon: FontAwesomeIcons.threads, url: 'https://www.threads.com/@mustaqeyym?igshid=NTc4MTIwNjQ2YQ==', color: const Color(0xFF000000)),
                            SocialIconButton(icon: FontAwesomeIcons.tiktok, url: 'https://www.tiktok.com/@.mqym?_r=1&_t=ZS-94IAjzgPl3d', color: const Color(0xFF000000)),
                            SocialIconButton(icon: FontAwesomeIcons.envelope, url: 'mailto:ilhammustaqeem8@gmail.com', color: const Color(0xFF1F2937)),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 24),
                  Container(
                    width: 76,
                    height: 76,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage('assets/images/photo_6145403992587046632_y.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // About
            ContentContainer(
              key: _aboutKey,
              verticalPadding: const EdgeInsets.only(bottom: 36),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const EditorialSectionHeader(
                    number: '01',
                    title: 'ABOUT',
                    jpLabel: '自己紹介',
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Here is a little background',
                    style: GoogleFonts.notoSerifJp(fontSize: 16, fontWeight: FontWeight.w700, color: AppColors.charcoal),
                  ),
                  const SizedBox(height: 14),
                  Text(
                    'Hey 👋🏼 Im Ilham, a tech guy based in Malaysia whos kinda obsessed with AI, coding, and building random ideas that pop into my head at 1AM.'
                    ' Outside of class, Im working on side projects, or exploring new tech I randomly decided to learn that week. I enjoy building things that actually work (and debugging them 47 times after).'
                    ' When Im not behind a screen, Im usually out doing something active such as solo traveling, biking, running, or trying literally any sport at least once. Im always down to try new things. Comfort zone? We dont know her.'
                    ' I like learning, growing, and challenging myself whether thats in tech, fitness, or life in general.'
                    ' If you are curious about what I have been doing lately, you can always check out my personal site 😉',
                    style: GoogleFonts.notoSansJp(fontSize: 13.5, color: AppColors.textSecondary, height: 1.8),
                  ),
                ],
              ),
            ),
            const ContentContainer(child: ThinDivider(padding: EdgeInsets.zero)),

            // Skills
            ContentContainer(
              key: _skillsKey,
              verticalPadding: const EdgeInsets.symmetric(vertical: 36),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const EditorialSectionHeader(
                    number: '02',
                    title: 'SKILLS',
                    jpLabel: '技術',
                  ),
                  const SizedBox(height: 24),
                  const SkillGroup(
                    label: 'PROGRAMMING',
                    items: ['Java', 'Python', 'Dart', 'HTML', 'JavaScript', 'SQL', 'YAML'],
                  ),
                  const SizedBox(height: 18),
                  const SkillGroup(
                    label: 'BACKEND & DEVELOPMENT',
                    items: ['REST API', 'Microservices', 'MVC', 'Application Development', 'Docker'],
                  ),
                  const SizedBox(height: 18),
                  const SkillGroup(
                    label: 'CLOUD & DEVOPS',
                    items: ['AWS Lambda', 'Amazon S3', 'EventBridge', 'GitLab CI/CD', 'ECR'],
                  ),
                  const SizedBox(height: 18),
                  const SkillGroup(
                    label: 'API & INTEGRATION',
                    items: ['IBM API Connect (APIC)', 'Swagger/OpenAPI'],
                  ),
                  const SizedBox(height: 18),
                  const SkillGroup(
                    label: 'DATABASE & TOOLS',
                    items: ['MySQL Workbench', 'Firebase', 'Oracle'],
                  ),
                  const SizedBox(height: 18),
                  const SkillGroup(
                    label: 'VERSION CONTROL',
                    items: ['GitLab', 'GitHub'],
                  ),
                  const SizedBox(height: 28),
                  Wrap(
                    spacing: 48,
                    runSpacing: 16,
                    children: [
                      _MetaLine(label: 'Current base', value: 'Kuala Lumpur — Apr 2026 to Present'),
                      _MetaLine(label: 'Previous base', value: 'Arau, Perlis — Jul 2023'),
                    ],
                  ),
                ],
              ),
            ),
            const ContentContainer(child: ThinDivider(padding: EdgeInsets.zero)),

            // Education
            ContentContainer(
              key: _educationKey,
              verticalPadding: const EdgeInsets.symmetric(vertical: 36),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const EditorialSectionHeader(
                    number: '03',
                    title: 'EDUCATION',
                    jpLabel: '学歴',
                  ),
                  const SizedBox(height: 24),
                  for (int i = 0; i < education.length; i++) ...[
                    if (i > 0) const ThinDivider(),
                    EducationEntry(
                      institution: education[i].institution,
                      degree: education[i].degree,
                      period: education[i].period,
                    ),
                  ],
                ],
              ),
            ),
            const ContentContainer(child: ThinDivider(padding: EdgeInsets.zero)),

            // Projects
            ContentContainer(
              key: _projectsKey,
              verticalPadding: const EdgeInsets.symmetric(vertical: 36),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const EditorialSectionHeader(
                    number: '04',
                    title: 'PROJECTS',
                    jpLabel: '作品',
                  ),
                  const SizedBox(height: 16),
                  Text('SELECTED PROJECTS', style: GoogleFonts.notoSansJp(fontSize: 12.5, fontWeight: FontWeight.w700, color: AppColors.charcoal, letterSpacing: 0.6)),
                  const SizedBox(height: 4),
                  Text('PROJECT ARCHIVE / 2023 — 2026', style: GoogleFonts.notoSansJp(fontSize: 11, color: AppColors.textSecondary, letterSpacing: 0.4)),
                  for (int i = 0; i < projects.length; i++) ...[
                    const ThinDivider(),
                    ProjectEntry(
                      index: i + 1,
                      title: projects[i].title,
                      tech: projects[i].technologies,
                      description: projects[i].description,
                      achievement: projects[i].achievement,
                      githubUrl: projects[i].githubUrl,
                      demoUrl: projects[i].demoUrl,
                    ),
                  ],
                  const ThinDivider(),
                  Row(
                    children: [
                      Icon(Icons.construction, size: 15, color: AppColors.muted),
                      const SizedBox(width: 8),
                      Text(
                        'MORE PROJECTS COMING SOON',
                        style: GoogleFonts.notoSansJp(fontSize: 11.5, color: AppColors.muted, letterSpacing: 0.8, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const ContentContainer(child: ThinDivider(padding: EdgeInsets.zero)),

            // Contact
            ContentContainer(
              key: _contactKey,
              verticalPadding: const EdgeInsets.symmetric(vertical: 36),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const EditorialSectionHeader(
                    number: '05',
                    title: 'CONTACT',
                    jpLabel: '連絡先',
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'I have got just what you need. Lets talk.',
                    style: GoogleFonts.notoSansJp(fontSize: 13.5, color: AppColors.textSecondary),
                  ),
                  const SizedBox(height: 20),
                  Wrap(
                    spacing: 36,
                    runSpacing: 14,
                    children: [
                      ContactInfo(
                        icon: Icons.phone,
                        info: '+601163831902',
                        onTap: () => launchUrl(Uri.parse('tel:+601163831902')),
                      ),
                      ContactInfo(
                        icon: Icons.email,
                        info: 'ilhammustaqeem8@gmail.com',
                        onTap: () => launchUrl(Uri.parse('mailto:ilhammustaqeem8@gmail.com')),
                      ),
                      const ContactInfo(
                        icon: Icons.location_on,
                        info: 'Malaysia',
                        onTap: null,
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SiteFooter(copyrightText: '© 2025 Ilham Mustaqeem. All rights reserved.'),
          ],
        ),
      ),
    );
  }
}

class _MetaLine extends StatelessWidget {
  final String label;
  final String value;
  const _MetaLine({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: GoogleFonts.notoSansJp(fontSize: 11, color: AppColors.textSecondary, letterSpacing: 0.8, fontWeight: FontWeight.w700)),
        const SizedBox(height: 4),
        Text(value, style: GoogleFonts.notoSansJp(fontSize: 13, color: AppColors.charcoal, fontWeight: FontWeight.w600)),
      ],
    );
  }
}

// Personal Site Page - Your Personal Space
// Personal Site Page - Your Personal Space
class PersonalSitePage extends StatefulWidget {
  const PersonalSitePage({super.key});

  @override
  State<PersonalSitePage> createState() => _PersonalSitePageState();
}

class _PersonalSitePageState extends State<PersonalSitePage> {
  // State for flip cards
  bool _isFlipped1 = false; // Running
  bool _isFlipped2 = false; // Biking
  bool _isFlipped3 = false; // Surfing
  bool _isFlipped4 = false; // Travelling

  final GlobalKey _aboutMeKey = GlobalKey();
  final GlobalKey _sportsKey = GlobalKey();
  final GlobalKey _adventuresKey = GlobalKey();

  void _scrollToSection(GlobalKey key) {
    final targetContext = key.currentContext;
    if (targetContext != null) {
      Scrollable.ensureVisible(
        targetContext,
        duration: const Duration(milliseconds: 450),
        curve: Curves.easeInOut,
        alignment: 0.04,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            EditorialHeader(
              handle: 'NOMADMUSTAQEEM',
              name: 'Ilham Mustaqeem',
              subtitle: 'Beyond the code · running · travel · craft',
              statusLine: 'PERSONAL SITE • MALAYSIA • 2026',
              onPortfolioTap: () {
                Navigator.pushReplacementNamed(context, '/');
              },
              onPersonalTap: () {},
            ),
            SiteNav(
              items: [
                SiteNavItem(label: 'About Me', onTap: () => _scrollToSection(_aboutMeKey)),
                SiteNavItem(label: 'Sports & Activities', onTap: () => _scrollToSection(_sportsKey)),
                SiteNavItem(label: 'Next Adventures', onTap: () => _scrollToSection(_adventuresKey)),
              ],
            ),

            // Compact intro — no large hero
            ContentContainer(
              verticalPadding: const EdgeInsets.symmetric(vertical: 36),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Beyond the Code',
                          style: GoogleFonts.notoSerifJp(
                            fontSize: 26,
                            fontWeight: FontWeight.w700,
                            color: AppColors.charcoal,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'My personal space — journey, adventures, and everything in between',
                          style: GoogleFonts.notoSansJp(
                            fontSize: 13.5,
                            color: AppColors.textSecondary,
                            height: 1.6,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 24),
                  Container(
                    width: 76,
                    height: 76,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage('assets/images/photo_6145403992587046632_y.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // SECTION 1: About Me
            ContentContainer(
              key: _aboutMeKey,
              verticalPadding: const EdgeInsets.symmetric(vertical: 36),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const EditorialSectionHeader(
                    number: '01',
                    title: 'ABOUT ME',
                    jpLabel: '私について',
                  ),
                  const SizedBox(height: 22),
                  Text(
                    'Mustaqeem',
                    style: GoogleFonts.notoSerifJp(fontSize: 20, fontWeight: FontWeight.w700, color: AppColors.charcoal),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Just a Guy From Somewhere',
                    style: GoogleFonts.notoSansJp(fontSize: 13.5, color: AppColors.textSecondary, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 20),

                  // Personal quote — flat, left-rule blockquote instead of a card
                  Container(
                    padding: const EdgeInsets.only(left: 16),
                    decoration: const BoxDecoration(
                      border: Border(left: BorderSide(color: AppColors.border, width: 2)),
                    ),
                    child: Text(
                      '"Tidak Masalah Seberapa Lambatnya Kamu Berjalan, Yang Penting Kamu Tidak Berhenti - Confucius"',
                      style: GoogleFonts.notoSansJp(
                        fontSize: 13.5,
                        color: AppColors.textSecondary,
                        height: 1.7,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ),
                  const SizedBox(height: 28),

                  Text(
                    'PERSONAL INFORMATION',
                    style: GoogleFonts.notoSansJp(fontSize: 11.5, color: AppColors.textSecondary, fontWeight: FontWeight.w700, letterSpacing: 1.1),
                  ),
                  const SizedBox(height: 16),
                  Wrap(
                    spacing: 40,
                    runSpacing: 18,
                    children: const [
                      _MetaLine(label: 'Full Name', value: 'Ilham Mustaqeem'),
                      _MetaLine(label: 'Age', value: '23 years old'),
                      _MetaLine(label: 'Languages', value: 'Malay (Native), English (Intermediate), German (Basic)'),
                      _MetaLine(label: 'Roots', value: '🇲🇾 Selangor, Malaysia | 🇹🇭 Kanchanaburi, Thailand'),
                      _MetaLine(label: 'Education', value: 'BIS Intelligent System Engineering, UiTM'),
                      _MetaLine(label: 'Current Role', value: 'None (Looking for Internship Position)'),
                      _MetaLine(label: 'Passions', value: 'Technology, Travel'),
                      _MetaLine(label: 'Hobbies', value: 'Anything got me sweat'),
                    ],
                  ),
                  const SizedBox(height: 28),
                  const _MetaLine(label: 'My Mission', value: 'Explore Each Country'),
                ],
              ),
            ),
            const ContentContainer(child: ThinDivider(padding: EdgeInsets.zero)),

            // SECTION 2: Sports & Activities (4 Flip Cards, horizontal scroll)
            ContentContainer(
              key: _sportsKey,
              verticalPadding: const EdgeInsets.symmetric(vertical: 36),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const EditorialSectionHeader(
                    number: '02',
                    title: 'SPORTS & ACTIVITIES',
                    jpLabel: '日常の力',
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Tap a card to flip it.',
                    style: GoogleFonts.notoSansJp(fontSize: 11.5, color: AppColors.muted),
                  ),
                  const SizedBox(height: 22),

                  // Four Flip Cards in a Row
                  SizedBox(
                    height: 500, // Fixed height for the row
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        Row(
                          children: [
                            // Running Card
                            SizedBox(
                              width: 330,
                              child: _FlipCard(
                                isFlipped: _isFlipped1,
                                onFlip: () {
                                  setState(() {
                                    _isFlipped1 = !_isFlipped1;
                                  });
                                },
                                frontContent: _SportFrontCard(
                                  title: 'Running',
                                  icon: Icons.directions_run,
                                  description: 'I started running to stay fit, but it became a passion. I do both regular road running and trail running. The trails call to me the mud, the hills, the forest. My first big challenge is coming up: a 30km+ trail run in Negeri Sembilan, July 2026.',
                                  achievements: [
                                    '🎽 Regular runner: 15-25km weekly',
                                    '🌲 First trail event: July 2026 (30km+)',
                                    '📍 Negeri Sembilan trail run (upcoming)',
                                    '⏱️ 5km PB: 32 minutes',
                                    
                                  ],
                                 stats: '30++ km Run',

                                ),
                                backContent: _SportBackCard(
                                  title: 'Running Gallery',
                                  images: [],
                                  caption: 'Training runs, trail adventures, and gearing up',
                                ),
                              ),
                            ),
                            const SizedBox(width: 45),
                            
                            // Biking Card
                            SizedBox(
                              width: 330,
                              child: _FlipCard(
                                isFlipped: _isFlipped2,
                                onFlip: () {
                                  setState(() {
                                    _isFlipped2 = !_isFlipped2;
                                  });
                                },
                                frontContent: _SportFrontCard(
                                  title: 'Biking',
                                  icon: Icons.directions_bike,
                                  description: 'Two wheels, two terrains. I ride both mountain bike (MTB) on rough trails and road bike on highways. The freedom of cycling keeps me going. Have a few achievements in local rides and events.',
                                  achievements: [
                                    '🚵 MTB: More than 10++ Jamboree/Event Participant',
                                    '🚴 Road bike:  More than 5++ Event Participant',
                                    '⛰️ Climbed Fraser Hill on bike',
                                    '🏅 SS Gelora Cycling Team',
                                  ],
                                  stats: 'MTB & Road Bike | 100km+ rides',
                                ),
                                backContent: _SportBackCard(
                                  title: 'Biking Gallery',
                                  images: [],
                                  caption: 'Mountain trails, road adventures, and cycling events',
                                ),
                              ),
                            ),
                            const SizedBox(width: 45),
                            
                            // Surfing Card
                            SizedBox(
                              width: 330,
                              child: _FlipCard(
                                isFlipped: _isFlipped3,
                                onFlip: () {
                                  setState(() {
                                    _isFlipped3 = !_isFlipped3;
                                  });
                                },
                                frontContent: _SportFrontCard(
                                  title: 'Surfing',
                                  icon: Icons.waves,
                                  description: 'Every monsoon season in Tioman, I hit the waves. Still learning, still improving but rarely. No achievements yet — just the joy of catching a good wave and the endless pursuit of better skills.',
                                  achievements: [
                                    '🏄‍♂️ Surfing since 2019',
                                    '🌊 Monsoon season regular at Tioman',
                                    '🔄 Working on: Pop-up & wave selection',
                                    '🎯 Goal: Ride unbroken waves consistently',
                                  ],
                                  stats: 'Beginner | Monsoon surfer',
                                ),
                                backContent: _SportBackCard(
                                  title: 'Surfing Gallery',
                                  images: [],
                                  caption: 'Monsoon waves, practice sessions, and beach life',
                                ),
                              ),
                            ),
                            const SizedBox(width: 45),
                            
                            // Travelling Card
                            SizedBox(
                              width: 330,
                              child: _FlipCard(
                                isFlipped: _isFlipped4,
                                onFlip: () {
                                  setState(() {
                                    _isFlipped4 = !_isFlipped4;
                                  });
                                },
                                frontContent: _SportFrontCard(
                                  title: 'Travelling',
                                  icon: Icons.flight,
                                  description: 'I travel solo. It\'s my way of finding myself and experiencing the world on my own terms. From Thailand islands to Malaysian beaches, from Indonesian cities to hidden gems. Every trip teaches me something new. Open to have travel partner/buddy',
                                  achievements: [
                                    '🌏 Solo traveller since 2022',
                                    '🇹🇭 Thailand: Krabi, Phuket, Ratchaburi, Hatyai, Koh Lipe',
                                    '🇲🇾 Malaysia: Tioman, Langkawi, Perhentian, Pangkor, Kudat',
                                    '🏝️ Island collector: 10+ islands visited',
                                  ],
                                  stats: 'Solo traveller | 2 countries | 15+ destinations (will be updating)',
                                ),
                                backContent: _SportBackCard(
                                  title: 'Travel Gallery',
                                  images: [],
                                  caption: 'Solo adventures, island escapes, and travel memories',
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

        // SECTION 3: Next Adventures — map on top, details stacked below
        ContentContainer(
          key: _adventuresKey,
          verticalPadding: const EdgeInsets.symmetric(vertical: 36),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const EditorialSectionHeader(
                number: '03',
                title: 'NEXT ADVENTURES',
                jpLabel: '次の旅',
              ),
              const SizedBox(height: 22),

              // Live route map — flat, thin border
              Container(
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.border),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.map_outlined, size: 16, color: AppColors.textSecondary),
                        const SizedBox(width: 8),
                        Text(
                          'Eurasian Trip 2028',
                          style: GoogleFonts.notoSansJp(fontSize: 13, fontWeight: FontWeight.w700, color: AppColors.charcoal),
                        ),
                      ],
                    ),
                    const SizedBox(height: 14),
                    SizedBox(
                      height: 280,
                      child: _ExpeditionMap(),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 28),

              // First Adventure (Trail Run)
              _ModernAdventureCard(
                title: 'First Trail Run Event',
                date: 'July 2026',
                duration: '30km+',
                location: 'Negeri Sembilan',
                imageUrl: 'https://www.trainingpeaks.com/blog/5-tips-for-technical-trail-running-and-racing/',
                description: 'My first official trail running event! Training hard for this 30km+ challenge through the beautiful trails of Negeri Sembilan.',
                highlights: const [
                  'Weekend trail runs',
                  'Hill endurance training',
                  'Route study & elevation',
                  'Goal: Finish strong',
                ],
                status: 'Training Phase',
                progress: 0.3,
                color: const Color(0xFF10B981),
              ),
              const SizedBox(height: 24),

              // Second Adventure (The Great Expedition) — flat, no gradient
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.border),
                ),
                child: _ExpeditionDetailCard(
                  title: 'Eurasian Overland Expedition (Will Be Updating)',
                  subtitle: 'Malaysia → Mongolia → China → Kyrgyzstan → Pakistan → Bosnia',
                  duration: 'Q3 2028 - Q3 2029',
                  imageUrl: 'https://images.unsplash.com/photo-1526495124232-a04e1849168c?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=80',
                  description: 'A once-in-a-lifetime overland journey across the Eurasian continent. Following ancient trade routes and modern adventures, this expedition will take me through some of the world most breathtaking landscapes and rich cultures.',
                  itinerary: const [
                    '🇲🇾 Malaysia → 🇲🇳 Mongolia: 2 months exploring the steppes, nomadic culture, and Gobi Desert',
                    '🇲🇳 Mongolia → 🇨🇳 China: 3 months traversing the Silk Road, from Xinjiang to Beijing',
                    '🇨🇳 China → 🇰🇬 Kyrgyzstan: 4 months in the Tian Shan mountains, alpine lakes, and yurt stays',
                    '🇰🇬 Kyrgyzstan → 🇵🇰 Pakistan: 2 months on the Karakoram Highway, through the Pamir Mountains',
                    '🇵🇰 Pakistan → 🇧🇦 Bosnia: 1 month in the Balkans, ending in Sarajevo',
                    '➕ 2 months TBD: Flexible exploration (possibly Turkey, Caucasus, or Europe)',
                  ],
                  stats: const {
                    'Total Duration': '12-14 months',
                    'Countries': '6+',
                    'Mongolia Stay': '2 months',
                    'China Stay': '3 months',
                    'Kyrgyzstan Stay': '4 months',
                    'Pakistan Stay': '2 months',
                    'Bosnia Stay': '1 month',
                  },
                ),
              ),
            ],
          ),
        ),

            const SiteFooter(copyrightText: '© 2025 Ilham Mustaqeem. All rights reserved.'),
          ],
        ),
      ),
    );
  }
}

// Personal Detail Card Widget
class _PersonalDetailCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _PersonalDetailCard({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE5E7EB)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 10, 10, 10).withOpacity(0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, size: 20, color: const Color.fromARGB(255, 9, 9, 9)),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: GoogleFonts.inter(
                    fontSize: 12,
                    color: const Color(0xFF6B7280),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  value,
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF1F2937),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Flip Card Widget
class _FlipCard extends StatefulWidget {
  final bool isFlipped;
  final VoidCallback onFlip;
  final Widget frontContent;
  final Widget backContent;

  const _FlipCard({
    required this.isFlipped,
    required this.onFlip,
    required this.frontContent,
    required this.backContent,
  });

  @override
  State<_FlipCard> createState() => _FlipCardState();
}

class _FlipCardState extends State<_FlipCard> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
    
    if (widget.isFlipped) {
      _controller.value = 1;
    }
  }

  @override
  void didUpdateWidget(_FlipCard oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isFlipped != oldWidget.isFlipped) {
      if (widget.isFlipped) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onFlip,
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          final isFront = _animation.value < 0.5;
          return Transform(
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.001)
              ..rotateY(_animation.value * 3.14159),
            alignment: Alignment.center,
            child: isFront ? widget.frontContent : Transform(
              transform: Matrix4.identity()..rotateY(3.14159),
              alignment: Alignment.center,
              child: widget.backContent,
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class _SportFrontCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final String description;
  final List<String> achievements;
  final String stats;

  const _SportFrontCard({
    required this.title,
    required this.icon,
    required this.description,
    required this.achievements,
    required this.stats,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.surface,
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title and Icon (Fixed at top)
          Row(
            children: [
              Icon(icon, size: 20, color: AppColors.accent),
              const SizedBox(width: 10),
              Text(
                title,
                style: GoogleFonts.notoSerifJp(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: AppColors.charcoal,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),

          // Stats (Fixed)
          Text(
            stats,
            style: GoogleFonts.notoSansJp(
              fontSize: 11.5,
              fontWeight: FontWeight.w600,
              color: AppColors.textSecondary,
            ),
          ),
          const SizedBox(height: 4),
          const ThinDivider(padding: EdgeInsets.only(bottom: 4)),
          const SizedBox(height: 16),
          
          // Scrollable Content Area
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(), // Enables scrolling with bounce effect
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // My Story
                  Text(
                    'My Story',
                    style: GoogleFonts.notoSansJp(
                      fontSize: 11.5,
                      fontWeight: FontWeight.w700,
                      color: AppColors.textSecondary,
                      letterSpacing: 0.6,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    description,
                    style: GoogleFonts.notoSansJp(
                      fontSize: 12.5,
                      color: AppColors.textPrimary,
                      height: 1.6,
                    ),
                  ),
                  const SizedBox(height: 14),

                  // Achievements
                  Text(
                    'Achievements',
                    style: GoogleFonts.notoSansJp(
                      fontSize: 11.5,
                      fontWeight: FontWeight.w700,
                      color: AppColors.textSecondary,
                      letterSpacing: 0.6,
                    ),
                  ),
                  const SizedBox(height: 6),

                  // Achievements List (Now scrollable within the Expanded)
                  ...achievements.map((achievement) => Padding(
                    padding: const EdgeInsets.only(bottom: 6),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '· ',
                          style: GoogleFonts.notoSansJp(fontSize: 13, color: AppColors.accent),
                        ),
                        Expanded(
                          child: Text(
                            achievement,
                            style: GoogleFonts.notoSansJp(fontSize: 12, color: AppColors.textSecondary),
                          ),
                        ),
                      ],
                    ),
                  )),
                ],
              ),
            ),
          ),

          const SizedBox(height: 8),

          // Flip Hint (Fixed at bottom)
          Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.touch_app, size: 12, color: AppColors.muted),
                const SizedBox(width: 4),
                Text(
                  'Tap to see gallery',
                  style: GoogleFonts.notoSansJp(fontSize: 10.5, color: AppColors.muted),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Sport Back Card (Image Collage Side)
class _SportBackCard extends StatelessWidget {
  final String title;
  final List<String> images;
  final String caption;

  const _SportBackCard({
    required this.title,
    required this.images,
    required this.caption,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.charcoal,
        border: Border.all(color: AppColors.charcoal),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title
          Text(
            title,
            style: GoogleFonts.notoSerifJp(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 14),

          // Image Collage Grid
          Expanded(
            child: GridView.count(
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              children: images.map((imageUrl) {
                return Image.network(
                  imageUrl,
                  fit: BoxFit.cover,
                );
              }).toList(),
            ),
          ),

          const SizedBox(height: 12),

          // Caption
          Text(
            caption,
            style: GoogleFonts.notoSansJp(
              fontSize: 11.5,
              color: Colors.white70,
              fontStyle: FontStyle.italic,
            ),
            textAlign: TextAlign.center,
          ),

          const SizedBox(height: 8),

          // Back Hint
          Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.touch_app, size: 12, color: Colors.white54),
                const SizedBox(width: 4),
                Text(
                  'Tap for story',
                  style: GoogleFonts.notoSansJp(fontSize: 10.5, color: Colors.white54),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Adventure Detail Card
// ignore: unused_element
class _AdventureDetailCard extends StatelessWidget {
  final String title;
  final String date;
  final String duration;
  final String location;
  final String imageUrl;
  final String description;
  final List<String> highlights;
  final String status;
  final double progress;

  const _AdventureDetailCard({
    required this.title,
    required this.date,
    required this.duration,
    required this.location,
    required this.imageUrl,
    required this.description,
    required this.highlights,
    required this.status,
    required this.progress,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.08),
            spreadRadius: 1,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
        border: Border.all(color: const Color(0xFFE5E7EB)),
      ),
      child: Column(
        children: [
          // Header with Image
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
            child: Stack(
              children: [
                Image.network(
                  imageUrl,
                  height: 150,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                Container(
                  height: 150,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        Colors.black.withOpacity(0.8),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 16,
                  left: 16,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: GoogleFonts.inter(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          Icon(Icons.calendar_today, size: 14, color: Colors.white70),
                          const SizedBox(width: 4),
                          Text(date, style: const TextStyle(color: Colors.white70, fontSize: 12)),
                          const SizedBox(width: 16),
                          Icon(Icons.location_on, size: 14, color: Colors.white70),
                          const SizedBox(width: 4),
                          Text(location, style: const TextStyle(color: Colors.white70, fontSize: 12)),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          
          // Content
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Status and Progress
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                      decoration: BoxDecoration(
                        color: _getStatusColor(status).withOpacity(0.1),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        status,
                        style: GoogleFonts.inter(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: _getStatusColor(status),
                        ),
                      ),
                    ),
                    Text(
                      duration,
                      style: GoogleFonts.inter(
                        fontSize: 12,
                        color: const Color(0xFF6B7280),
                      ),
                    ),
                  ],
                ),
                
                const SizedBox(height: 12),
                
                // Progress Bar
                Row(
                  children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: LinearProgressIndicator(
                          value: progress,
                          backgroundColor: const Color(0xFFF3F4F6),
                          valueColor: const AlwaysStoppedAnimation<Color>(Color.fromARGB(255, 19, 19, 19)),
                          minHeight: 6,
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Text(
                      '${(progress * 100).toInt()}%',
                      style: GoogleFonts.inter(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: const Color.fromARGB(255, 14, 14, 14),
                      ),
                    ),
                  ],
                ),
                
                const SizedBox(height: 12),
                
                // Description
                Text(
                  description,
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    color: const Color(0xFF4B5563),
                    height: 1.5,
                  ),
                ),
                
                const SizedBox(height: 16),
                
                // Highlights
                Text(
                  'Plans & Goals',
                  style: GoogleFonts.inter(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF111827),
                  ),
                ),
                const SizedBox(height: 12),
                
                ...highlights.map((highlight) => Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.check_circle,
                        size: 18,
                        color: const Color(0xFF10B981),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          highlight,
                          style: GoogleFonts.inter(
                            fontSize: 14,
                            color: const Color(0xFF4B5563),
                          ),
                        ),
                      ),
                    ],
                  ),
                )),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Color _getStatusColor(String status) {
    switch (status) {
      case 'Planning Phase':
        return const Color(0xFFF59E0B);
      case 'Training Phase':
        return const Color(0xFF10B981);
      case 'In Progress':
        return const Color(0xFF2563EB);
      default:
        return const Color(0xFF6B7280);
    }
  }
}

// New Widget: Activity Card with Image and Achievements
// ignore: unused_element
class _ActivityCard extends StatelessWidget {
  final String title;
  final String imageUrl;
  final List<String> achievements;
  final String description;
  final bool isSelected;
  final VoidCallback onTap;

  const _ActivityCard({
    required this.title,
    required this.imageUrl,
    required this.achievements,
    required this.description,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: isSelected 
                  ? const Color(0xFF2563EB).withOpacity(0.2)
                  : Colors.grey.withOpacity(0.1),
              spreadRadius: isSelected ? 4 : 1,
              blurRadius: isSelected ? 8 : 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image Section
            Expanded(
              flex: 3,
              child: ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(16),
                ),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.network(
                      imageUrl,
                      fit: BoxFit.cover,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.transparent,
                            Colors.black.withOpacity(0.7),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 12,
                      left: 12,
                      child: Text(
                        title,
                        style: GoogleFonts.inter(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            
            // Achievements Section (shown when selected)
            if (isSelected)
              Expanded(
                flex: 2,
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.vertical(
                      bottom: Radius.circular(16),
                    ),
                    border: Border.all(color: const Color(0xFFE5E7EB)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Achievements',
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: const Color.fromARGB(255, 17, 17, 17),
                        ),
                      ),
                      const SizedBox(height: 8),
                      ...achievements.map((achievement) => Padding(
                        padding: const EdgeInsets.only(bottom: 6),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('• ', style: TextStyle(fontSize: 14)),
                            Expanded(
                              child: Text(
                                achievement,
                                style: GoogleFonts.inter(
                                  fontSize: 12,
                                  color: const Color(0xFF4B5563),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )),
                      const SizedBox(height: 8),
                      Text(
                        description,
                        style: GoogleFonts.inter(
                          fontSize: 11,
                          color: const Color(0xFF6B7280),
                          fontStyle: FontStyle.italic,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

// Additional widgets (ProjectCard, SkillChip, SkillContainer, EducationCard, ExtracurricularCard, ContactInfo variants, Timeline, etc.)
// For brevity these are omitted here — the main structure is preserved and uses existing shared widgets where possible.
// --- Added missing widgets from original personal page ---

class _ModernAdventureCard extends StatelessWidget {
  final String title;
  final String date;
  final String duration;
  final String location;
  final String imageUrl;
  final String description;
  final List<String> highlights;
  final String status;
  final double progress;
  final Color color;

  const _ModernAdventureCard({
    required this.title,
    required this.date,
    required this.duration,
    required this.location,
    required this.imageUrl,
    required this.description,
    required this.highlights,
    required this.status,
    required this.progress,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: AppColors.surface,
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Text(
            title,
            style: GoogleFonts.notoSerifJp(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: AppColors.charcoal,
            ),
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              Icon(Icons.calendar_today, size: 12, color: AppColors.muted),
              const SizedBox(width: 4),
              Text(date, style: GoogleFonts.notoSansJp(color: AppColors.textSecondary, fontSize: 11)),
              const SizedBox(width: 12),
              Icon(Icons.location_on, size: 12, color: AppColors.muted),
              const SizedBox(width: 4),
              Text(location, style: GoogleFonts.notoSansJp(color: AppColors.textSecondary, fontSize: 11)),
            ],
          ),
          const SizedBox(height: 14),

          // Status and progress
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                status.toUpperCase(),
                style: GoogleFonts.notoSansJp(
                  fontSize: 10.5,
                  fontWeight: FontWeight.w700,
                  color: color,
                  letterSpacing: 0.6,
                ),
              ),
              Text(
                duration,
                style: GoogleFonts.notoSansJp(fontSize: 11, color: AppColors.textSecondary),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: LinearProgressIndicator(
                  value: progress,
                  backgroundColor: AppColors.border,
                  valueColor: AlwaysStoppedAnimation<Color>(color),
                  minHeight: 3,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                '${(progress * 100).toInt()}%',
                style: GoogleFonts.notoSansJp(fontSize: 11, fontWeight: FontWeight.w600, color: color),
              ),
            ],
          ),
          const SizedBox(height: 12),

          // Description
          Text(
            description,
            style: GoogleFonts.notoSansJp(fontSize: 12.5, color: AppColors.textSecondary, height: 1.5),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}

class _SkillBoardCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final List<String> items;

  const _SkillBoardCard({
    required this.title,
    required this.subtitle,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.surface,
        border: Border.all(color: AppColors.charcoal, width: 2),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: AppColors.charcoal.withOpacity(0.12),
            offset: const Offset(6, 6),
            blurRadius: 0,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w700,
              color: AppColors.charcoal,
            ) ?? const TextStyle(color: AppColors.charcoal),
          ),
          const SizedBox(height: 8),
          Text(
            subtitle,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: AppColors.textSecondary,
            ) ?? const TextStyle(color: AppColors.textSecondary),
          ),
          const SizedBox(height: 18),
          ...items.map(
            (item) => Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 10,
                    height: 10,
                    margin: const EdgeInsets.only(top: 6, right: 10),
                    decoration: BoxDecoration(
                      color: AppColors.accent,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      item,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: AppColors.charcoal,
                        height: 1.6,
                      ) ?? const TextStyle(color: AppColors.charcoal),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _CompactInfoCard extends StatelessWidget {
  final String label;
  final String location;
  final String period;

  const _CompactInfoCard({
    required this.label,
    required this.location,
    required this.period,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: AppColors.surface,
        border: Border.all(color: AppColors.border, width: 2),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
              color: AppColors.textSecondary,
              letterSpacing: 1.1,
              fontWeight: FontWeight.w700,
            ) ?? const TextStyle(color: AppColors.textSecondary),
          ),
          const SizedBox(height: 14),
          Text(
            location,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: AppColors.charcoal,
              fontWeight: FontWeight.w700,
            ) ?? const TextStyle(color: AppColors.charcoal),
          ),
          const SizedBox(height: 8),
          Text(
            period,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: AppColors.accent,
              fontWeight: FontWeight.w600,
            ) ?? const TextStyle(color: AppColors.accent),
          ),
        ],
      ),
    );
  }
}

class _ExpeditionDetailCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String duration;
  final String imageUrl;
  final String description;
  final List<String> itinerary;
  final Map<String, String> stats;

  const _ExpeditionDetailCard({
    required this.title,
    required this.subtitle,
    required this.duration,
    required this.imageUrl,
    required this.description,
    required this.itinerary,
    required this.stats,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title Section
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(Icons.explore_outlined, color: AppColors.accent, size: 20),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: GoogleFonts.notoSerifJp(
                        fontSize: 17,
                        fontWeight: FontWeight.w700,
                        color: AppColors.charcoal,
                      ),
                    ),
                    Text(
                      subtitle,
                      style: GoogleFonts.notoSansJp(
                        fontSize: 12.5,
                        color: AppColors.textSecondary,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                duration,
                style: GoogleFonts.notoSansJp(
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                  color: AppColors.accent,
                ),
              ),
            ],
          ),

          const SizedBox(height: 18),

          // Stats
          Wrap(
            spacing: 24,
            runSpacing: 14,
            children: stats.entries.map((entry) {
              return SizedBox(
                width: 100,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      entry.key,
                      style: GoogleFonts.notoSansJp(fontSize: 10.5, color: AppColors.textSecondary),
                    ),
                    Text(
                      entry.value,
                      style: GoogleFonts.notoSansJp(fontSize: 13, fontWeight: FontWeight.w700, color: AppColors.charcoal),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),

          const SizedBox(height: 18),

          // Description
          Text(
            description,
            style: GoogleFonts.notoSansJp(
              fontSize: 12.5,
              color: AppColors.textSecondary,
              height: 1.6,
            ),
          ),

          const SizedBox(height: 18),

          // Itinerary Timeline
          Text(
            'EXPEDITION ITINERARY',
            style: GoogleFonts.notoSansJp(
              fontSize: 11,
              fontWeight: FontWeight.w700,
              color: AppColors.textSecondary,
              letterSpacing: 0.8,
            ),
          ),
          const SizedBox(height: 14),
          
          ...itinerary.asMap().entries.map((entry) {
            final colors = [
              const Color(0xFF2563EB),
              const Color(0xFFF59E0B),
              const Color(0xFF10B981),
              const Color(0xFF8B5CF6),
              const Color(0xFFEC4899),
              const Color(0xFF6B7280),
            ];
            return Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 24,
                    height: 24,
                    decoration: BoxDecoration(
                      color: colors[entry.key % colors.length].withOpacity(0.1),
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        '${entry.key + 1}',
                        style: GoogleFonts.inter(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: colors[entry.key % colors.length],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      entry.value,
                      style: GoogleFonts.inter(
                        fontSize: 13,
                        color: const Color(0xFF4B5563),
                        height: 1.5,
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }
}

class _ExpeditionMap extends StatelessWidget {
  const _ExpeditionMap({Key? key}) : super(key: key);

  static final List<LatLng> _route = [
    LatLng(3.1390, 101.6869), // Kuala Lumpur
    LatLng(39.9042, 116.4074), // Beijing (example leg)
    LatLng(42.8746, 74.5698), // Bishkek
    LatLng(41.9028, 12.4964), // Rome (example)
  ];

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      options: MapOptions(
        initialCenter: _route.first,
        initialZoom: 3.5,
      ),
      children: [
        TileLayer(
          urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
          subdomains: const ['a', 'b', 'c'],
          userAgentPackageName: 'com.example.portfolio',
        ),
        PolylineLayer(
          polylines: [
            Polyline(
              points: _route,
              color: AppColors.accent.withOpacity(0.9),
              strokeWidth: 3.0,
            ),
          ],
        ),
        MarkerLayer(
          markers: _route
              .map(
                (p) => Marker(
                  point: p,
                  width: 32,
                  height: 32,
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.surface,
                      border: Border.all(color: AppColors.charcoal, width: 1),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(Icons.place, color: AppColors.accent, size: 16),
                  ),
                ),
              )
              .toList(),
        ),
      ],
    );
  }

  }
