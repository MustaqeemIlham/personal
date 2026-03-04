import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:flutter_staggered_animations/animation_configuration.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
void main() {
  runApp(const MyPortfolio());
}

class MyPortfolio extends StatelessWidget {
  const MyPortfolio({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ilham Mustaqeem - AI Developer',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFF2563EB),
        scaffoldBackgroundColor: Colors.white,
        textTheme: GoogleFonts.interTextTheme(),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          elevation: 0,
          iconTheme: IconThemeData(color: Color(0xFF1F2937)),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const PortfolioHomePage(),
        '/personal': (context) => const PersonalSitePage(),
      },
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
  final List<String> _sectionKeys = ['home', 'about', 'experience', 'projects', 'skills', 'education', 'contact'];

  void _scrollToSection(int index) {
    final double offset = index * MediaQuery.of(context).size.height * 0.9;
    _scrollController.animateTo(
      offset,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Navigation Bar
            // Navigation Bar
Container(
  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
  color: Colors.white,
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        'NOMAD MUSTAQEEM',
        style: GoogleFonts.inter(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: const Color(0xFF1F2937),
        ),
      ),
      Row(
        children: [
          _NavButton(
            text: 'About',
            onTap: () => _scrollToSection(1),
          ),
          const SizedBox(width: 20),
          _NavButton(
            text: 'Experience',
            onTap: () => _scrollToSection(2),
          ),
          const SizedBox(width: 20),
          _NavButton(
            text: 'Projects',
            onTap: () => _scrollToSection(3),
          ),
          const SizedBox(width: 20),
          _NavButton(
            text: 'Skills',
            onTap: () => _scrollToSection(4),
          ),
          const SizedBox(width: 20),
          _NavButton(
            text: 'Contact',
            onTap: () => _scrollToSection(6),
          ),
          const SizedBox(width: 20),
          Container(
            height: 30,
            width: 1,
            color: const Color(0xFFE5E7EB),
          ),
          const SizedBox(width: 20),
          _NavButton(
            text: 'Personal Site',
            onTap: () {
              Navigator.pushNamed(context, '/personal');
            },
            isHighlighted: true,
          ),
        ],
      ),
    ],
  ),
),
            


            Container(
  height: 500,
  padding: const EdgeInsets.symmetric(horizontal: 40),
  child: Row(
    children: [
      Expanded(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
                         
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hi, the name\'s',
                          style: GoogleFonts.inter(
                            fontSize: 24,
                            color: const Color(0xFF6B7280),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'Ilham Mustaqeem',
                          style: GoogleFonts.inter(
                            fontSize: 64,
                            fontWeight: FontWeight.bold,
                            color: const Color(0xFF111827),
                          ),
                        ),
                        const SizedBox(height: 20),
                        SizedBox(
                          height: 50,
                          child: AnimatedTextKit(
                           animatedTexts: [
  TypewriterAnimatedText(
    'AI Developer & Software Engineer',
    textStyle: GoogleFonts.inter(
      fontSize: 28,
      color: const Color(0xFF4B5563),
    ),
    speed: const Duration(milliseconds: 100),
  ),
    TypewriterAnimatedText(
    'I Try Every Sport',
    textStyle: GoogleFonts.inter(
      fontSize: 28,
      color: const Color(0xFF4B5563),
    ),
    speed: const Duration(milliseconds: 100),
  ),
  TypewriterAnimatedText(
    'Im Big Fan of Money',
    textStyle: GoogleFonts.inter(
      fontSize: 28,
      color: const Color(0xFF4B5563),
    ),
    speed: const Duration(milliseconds: 100),
  ),
    TypewriterAnimatedText(
    'Bikepacking & Backpacking Explorer',
    textStyle: GoogleFonts.inter(
      fontSize: 28,
      color: const Color(0xFF4B5563),
    ),
    speed: const Duration(milliseconds: 100),
  ),
  TypewriterAnimatedText(
    'Solo Travel Enthusiast',
    textStyle: GoogleFonts.inter(
      fontSize: 28,
      color: const Color(0xFF4B5563),
    ),
    speed: const Duration(milliseconds: 100),
  ),
  TypewriterAnimatedText(
    'Runner & Trail Runner',
    textStyle: GoogleFonts.inter(
      fontSize: 28,
      color: const Color(0xFF4B5563),
    ),
    speed: const Duration(milliseconds: 100),
  ),
  TypewriterAnimatedText(
    'Surfing Adventurer',
    textStyle: GoogleFonts.inter(
      fontSize: 28,
      color: const Color(0xFF4B5563),
    ),
    speed: const Duration(milliseconds: 100),
  ),
  TypewriterAnimatedText(
    'Mobile & Web Application Developer',
    textStyle: GoogleFonts.inter(
      fontSize: 28,
      color: const Color(0xFF4B5563),
    ),
    speed: const Duration(milliseconds: 100),
  ),
  TypewriterAnimatedText(
    'Data Analytics Enthusiast',
    textStyle: GoogleFonts.inter(
      fontSize: 28,
      color: const Color(0xFF4B5563),
    ),
    speed: const Duration(milliseconds: 100),
  ),

],
                            totalRepeatCount: 100,
                            pause: const Duration(milliseconds: 2000),
                            displayFullTextOnTap: true,
                            stopPauseOnTap: true,
                          ),
                        ),
                        const SizedBox(height: 30),
                        Row(
                          children: [
                           _SocialIconButton(
  icon: FontAwesomeIcons.github,
  url: 'https://github.com/ilham-mustaqeem',
  color: const Color(0xFF1F2937),
),
const SizedBox(width: 15),
_SocialIconButton(
  icon: FontAwesomeIcons.linkedin,
  url: 'https://www.linkedin.com/in/ilham-mustaqeem-130797269/',
  color: const Color(0xFF2563EB),
),
const SizedBox(width: 15),
_SocialIconButton(
  icon: FontAwesomeIcons.instagram,
  url: 'https://www.instagram.com/mustaqeyym?igsh=MTNrZDM3NjB5ZTZzZg%3D%3D&utm_source=qr', // Replace with your Instagram username
  color: const Color(0xFFE4405F), // Instagram's brand color
),
const SizedBox(width: 15),
_SocialIconButton(
  icon: FontAwesomeIcons.youtube,
  url: 'https://youtube.com/@mustnomad?si=sXfdFmEkofJTcfQh', // Replace with your YouTube channel
  color: const Color(0xFFFF0000), // YouTube's brand red
),
const SizedBox(width: 15),
_SocialIconButton(
  icon: FontAwesomeIcons.threads,
  url: 'https://www.threads.com/@mustaqeyym?igshid=NTc4MTIwNjQ2YQ==', // Replace with your Threads username
  color: const Color(0xFF000000), // Threads uses black
),
const SizedBox(width: 15),
_SocialIconButton(
  icon: FontAwesomeIcons.tiktok,
  url: 'https://www.tiktok.com/@.mqym?_r=1&_t=ZS-94IAjzgPl3d', // Replace with your TikTok username
  color: const Color(0xFF000000), // TikTok typically uses black
),
const SizedBox(width: 15),
_SocialIconButton(
  icon: FontAwesomeIcons.envelope,
  url: 'mailto:ilhammustaqeem8@gmail.com',
  color: const Color(0xFF1F2937),
),
                          ],
                        ),
                      ],
                    ),
                  ),
                  
            // ... your text content stays the same ...
          ],
        ),
      ),
      
      // 👇 REPLACE WITH THIS ANIMATED WIDGET
       AnimatedProfileImage(),
    ],
  ),
),

            // About Section
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 60),
              color: const Color(0xFFF9FAFB),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'About',
                    style: GoogleFonts.inter(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF111827),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(width: 60, height: 3, color: const Color(0xFF2563EB)),
                  const SizedBox(height: 30),
                  Text(
                    'Here is a little background',
                    style: GoogleFonts.inter(
                      fontSize: 24,
                      color: const Color(0xFF1F2937),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Hey 👋🏼 Im Ilham, a tech guy based in Malaysia whos kinda obsessed with AI, coding, and building random ideas that pop into my head at 1AM.'
                    ' Outside of class, Im working on side projects, or exploring new tech I randomly decided to learn that week. I enjoy building things that actually work (and debugging them 47 times after).'
                    ' When Im not behind a screen, Im usually out doing something active such as solo traveling, biking, running, or trying literally any sport at least once. Im always down to try new things. Comfort zone? We dont know her.'
                    ' I like learning, growing, and challenging myself whether thats in tech, fitness, or life in general.'
                    ' If you are curious about what I have been doing lately, you can always check out my personal site 😉',
                    style: GoogleFonts.inter(
                      fontSize: 18,
                      color: const Color(0xFF4B5563),
                      height: 1.6,
                    ),
                  ),
                ],
              ),
            ),

          // Experience Section
Container(
  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 60),
  color: Colors.white,
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      // Header with preview badge
      Row(
        children: [
          Text(
            'Experience',
            style: GoogleFonts.inter(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF111827),
            ),
          ),
          // const SizedBox(width: 20),
          // // Preview Mode Badge
          // Container(
          //   padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          //   decoration: BoxDecoration(
          //     color: const Color(0xFF2563EB).withOpacity(0.1),
          //     borderRadius: BorderRadius.circular(20),
          //     border: Border.all(
          //       color: const Color(0xFF2563EB).withOpacity(0.3),
          //     ),
          //   ),
          //   child: Row(
          //     mainAxisSize: MainAxisSize.min,
          //     children: [
          //       Icon(
          //         Icons.remove_red_eye,
          //         size: 16,
          //         color: const Color(0xFF2563EB),
          //       ),
          //       const SizedBox(width: 6),
          //       Text(
          //         'PREVIEW MODE',
          //         style: GoogleFonts.inter(
          //           fontSize: 12,
          //           fontWeight: FontWeight.w600,
          //           color: const Color(0xFF2563EB),
          //           letterSpacing: 0.5,
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
        ],
      ),
      const SizedBox(height: 10),
      Container(width: 60, height: 3, color: const Color(0xFF2563EB)),
      const SizedBox(height: 40),
      
      // Experience Cards
      _ExperienceCard(
        title: 'Software Developer Intern',
        company: 'InsiteMY Systems Sdn Bhd',
        location: 'Bangsar South, Kuala Lumpur',
        date: 'Sept 2023 – Mar 2024',
        bullets: [
          'Developed and maintained the enterprise Outward Clearing (Cheque) System using C#, ASP.NET MVC, JavaScript',
          'Enhanced database performance and reporting accuracy by designing views, updating datasets, and optimizing queries using SQL Server',
          'Collaborated with the team using Git/GitHub practice',
        ],
      ),
      const SizedBox(height: 30),
      _ExperienceCard(
        title: 'System Development Evaluator',
        company: 'University Technology Mara',
        location: 'Kuala Terengganu, Terengganu',
        date: 'Jun 2023',
        bullets: [
          'Evaluated student system development projects during presentations',
          'Provided structured feedback on design, functionality, and implementation quality',
        ],
      ),
        const SizedBox(height: 30),
      _ExperienceCard(
        title: 'Deploying AI LLM-Powered Applications Workshop (Participant & Program Committee Member)',
        company: 'University Technology Mara',
        location: 'Shah Alam, Selangor',
        date: 'Jun 2025',
        bullets: [
         'Assisted in program flow coordination, participant support, and floor management. Provided technical assistance in software installation and error handling during workshop sessions.'
        ],
      ),

       const SizedBox(height: 30),
      _ExperienceCard(
        title: 'Flood Relief Volunteer',
        company: 'University Technology Mara',
        location: 'Kuala Terengganu, Terengganu',
        date: 'Dec 2022',
        bullets: [
         'Assisted flood victims by cleaning and restoring homes after severe flooding. Contributed to community recovery efforts and humanitarian aid.'
        ],
      ),
      
      // Preview/Coming Soon Indicator
      const SizedBox(height: 40),
      Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 30),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.transparent,
              const Color(0xFF2563EB).withOpacity(0.05),
              const Color(0xFF2563EB).withOpacity(0.1),
            ],
          ),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: const Color(0xFF2563EB).withOpacity(0.2),
            style: BorderStyle.solid,
          ),
        ),
        child: Column(
          children: [
            // Animated dots or progress indicator
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(5, (index) {
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: index < 2 
                        ? const Color(0xFF2563EB) 
                        : const Color(0xFF2563EB).withOpacity(0.2),
                  ),
                );
              }),
            ),
            const SizedBox(height: 20),
            
            // "More coming soon" text with icon
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.construction,
                  size: 20,
                  color: const Color(0xFF2563EB).withOpacity(0.7),
                ),
                const SizedBox(width: 10),
                Text(
                  'MORE EXPERIENCES COMING SOON',
                  style: GoogleFonts.inter(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF2563EB).withOpacity(0.8),
                    letterSpacing: 0.5,
                  ),
                ),
                const SizedBox(width: 10),
                Icon(
                  Icons.hourglass_empty,
                  size: 20,
                  color: const Color(0xFF2563EB).withOpacity(0.7),
                ),
              ],
            ),
            
            const SizedBox(height: 10),
            
            // Subtle hint text
            Text(
              'Currently updating with new roles and achievements',
              style: GoogleFonts.inter(
                fontSize: 14,
                color: const Color(0xFF6B7280),
              ),
            ),
            
            const SizedBox(height: 20),
            
            // "View Full Resume" button (optional)
            // MouseRegion(
            //   cursor: SystemMouseCursors.click,
            //   child: GestureDetector(
            //     onTap: () {
            //       // Add your resume PDF link here
            //       // launchUrl(Uri.parse('link_to_your_resume.pdf'));
            //     },
            //     child: Container(
            //       padding: const EdgeInsets.symmetric(
            //         horizontal: 24,
            //         vertical: 12,
            //       ),
            //       decoration: BoxDecoration(
            //         color: Colors.white,
            //         borderRadius: BorderRadius.circular(30),
            //         boxShadow: [
            //           BoxShadow(
            //             color: const Color(0xFF2563EB).withOpacity(0.1),
            //             blurRadius: 10,
            //             offset: const Offset(0, 4),
            //           ),
            //         ],
            //       ),
            //       child: Row(
            //         mainAxisSize: MainAxisSize.min,
            //         children: [
            //           Text(
            //             'VIEW FULL RESUME',
            //             style: GoogleFonts.inter(
            //               fontSize: 14,
            //               fontWeight: FontWeight.w600,
            //               color: const Color(0xFF2563EB),
            //             ),
            //           ),
            //           const SizedBox(width: 8),
            //           const Icon(
            //             Icons.arrow_forward,
            //             size: 16,
            //             color: Color(0xFF2563EB),
            //           ),
            //         ],
            //       ),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
      
      // Optional: Add a subtle note that this is a preview
      //const SizedBox(height: 20),
      // Center(
      //   child: Text(
      //     'Preview version • Full portfolio available upon request',
      //     style: GoogleFonts.inter(
      //       fontSize: 12,
      //       color: const Color(0xFF9CA3AF),
      //       fontStyle: FontStyle.italic,
      //     ),
      //   ),
      // ),
    ],
  ),
),
     // Projects Section
Container(
  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 60),
  color: const Color(0xFFF9FAFB),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        'Projects',
        style: GoogleFonts.inter(
          fontSize: 40,
          fontWeight: FontWeight.bold,
          color: const Color(0xFF111827),
        ),
      ),
      const SizedBox(height: 10),
      Container(width: 60, height: 3, color: const Color(0xFF2563EB)),
      const SizedBox(height: 40),
      
      // Projects Row with fixed height container
      SizedBox(
        height: 420, // Fixed height for the entire row
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _ProjectCard(
                  title: 'Vegetable Crop Type Recommendation System',
                  technologies: 'Flutter, Python, Random Forest, Scikit-Learn, Flask',
                  description: 'Built a Random Forest model for crop price prediction (regression) and crop type prediction (classification). Integrated with mobile app using Flutter and Python backend.',
                  achievement: 'R² score: 94.23% | Accuracy: 95.67%',
                ),
                const SizedBox(width: 30),
                _ProjectCard(
                  title: 'IoT Flood Awareness and Early Warning System',
                  technologies: 'Raspberry Pi, Zigbee2MQTT, MQTT, Flutter, Firebase',
                  description: 'Developed IoT flood-awareness prototype with real-time water-level monitoring, Zigbee device management, and automated alarm triggering.',
                  achievement: 'Deployed in Kampung Budiman, Klang',
                ),
                const SizedBox(width: 30),
                _ProjectCard(
                  title: 'Retail Price Optimization Using Genetic Algorithm',
                  technologies: 'Python, Genetic Algorithm, Regression',
                  description: 'Developed optimization model combining regression with genetic algorithms for retail product pricing.',
                  achievement: 'Optimal price: RM 1,374.21',
                ),
                const SizedBox(width: 30),
                _ProjectCard(
                  title: 'Techworldwide E-Commerce Website',
                  technologies: 'HTML, CSS, PHP, JavaScript, MySQL, Bootstrap',
                  description: 'Developed group e-commerce system with product listings, cart, checkout, admin-login, and order management.',
                  achievement: 'Full-stack e-commerce implementation',
                ),
              ],
            ),
          ],
        ),
      ),
      const SizedBox(height: 40),
      Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 30),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.transparent,
              const Color(0xFF2563EB).withOpacity(0.05),
              const Color(0xFF2563EB).withOpacity(0.1),
            ],
          ),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: const Color(0xFF2563EB).withOpacity(0.2),
            style: BorderStyle.solid,
          ),
        ),
        child: Column(
          children: [
            // Animated dots or progress indicator
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(5, (index) {
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: index < 2 
                        ? const Color(0xFF2563EB) 
                        : const Color(0xFF2563EB).withOpacity(0.2),
                  ),
                );
              }),
            ),
            const SizedBox(height: 20),
            
            // "More coming soon" text with icon
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.construction,
                  size: 20,
                  color: const Color(0xFF2563EB).withOpacity(0.7),
                ),
                const SizedBox(width: 10),
                Text(
                  'MORE PROJECTS COMING SOON',
                  style: GoogleFonts.inter(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF2563EB).withOpacity(0.8),
                    letterSpacing: 0.5,
                  ),
                ),
                const SizedBox(width: 10),
                Icon(
                  Icons.hourglass_empty,
                  size: 20,
                  color: const Color(0xFF2563EB).withOpacity(0.7),
                ),
              ],
            ),
            
            const SizedBox(height: 10),
            
            // Subtle hint text
            Text(
              'Currently updating',
              style: GoogleFonts.inter(
                fontSize: 14,
                color: const Color(0xFF6B7280),
              ),
            ),
            
            const SizedBox(height: 20),
            
            // "View Full Resume" button (optional)
            // MouseRegion(
            //   cursor: SystemMouseCursors.click,
            //   child: GestureDetector(
            //     onTap: () {
            //       // Add your resume PDF link here
            //       // launchUrl(Uri.parse('link_to_your_resume.pdf'));
            //     },
            //     child: Container(
            //       padding: const EdgeInsets.symmetric(
            //         horizontal: 24,
            //         vertical: 12,
            //       ),
            //       decoration: BoxDecoration(
            //         color: Colors.white,
            //         borderRadius: BorderRadius.circular(30),
            //         boxShadow: [
            //           BoxShadow(
            //             color: const Color(0xFF2563EB).withOpacity(0.1),
            //             blurRadius: 10,
            //             offset: const Offset(0, 4),
            //           ),
            //         ],
            //       ),
            //       child: Row(
            //         mainAxisSize: MainAxisSize.min,
            //         children: [
            //           Text(
            //             'VIEW FULL RESUME',
            //             style: GoogleFonts.inter(
            //               fontSize: 14,
            //               fontWeight: FontWeight.w600,
            //               color: const Color(0xFF2563EB),
            //             ),
            //           ),
            //           const SizedBox(width: 8),
            //           const Icon(
            //             Icons.arrow_forward,
            //             size: 16,
            //             color: Color(0xFF2563EB),
            //           ),
            //         ],
            //       ),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    ],
  ),
),
            // Skills Section
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 60),
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Skills',
                    style: GoogleFonts.inter(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF111827),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(width: 60, height: 3, color: const Color(0xFF2563EB)),
                  const SizedBox(height: 30),
                  Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: [
                      _SkillChip('Python', 0.7),
                      _SkillChip('Flutter', 0.7),
                      _SkillChip('C# / .NET', 0.5),
                      _SkillChip('JavaScript', 0.5),
                      _SkillChip('SQL Server', 0.6),
                      _SkillChip('ASP.NET MVC', 0.5),
                      _SkillChip('Html', 0.6),
                      _SkillChip('Java', 0.5),
                      _SkillChip('CSS', 6),
                      _SkillChip('IoT / MQTT', 0.4),
                      _SkillChip('Firebase', 0.6),
                      _SkillChip('RapidMiner', 0.4),
                      _SkillChip('Power BI', 0.5),
                      _SkillChip('Flask', 0.4),
                      _SkillChip('Git/GitHub', 0.5),
                      _SkillChip('PHP', 0.5),
                      _SkillChip('Machine Learning', 0.75),
                      _SkillChip('Deep Learning', 0.60),
                    ],
                  ),
                ],
              ),
            ),

            // Education Section
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 60),
              color: const Color(0xFFF9FAFB),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Education',
                    style: GoogleFonts.inter(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF111827),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(width: 60, height: 3, color: const Color(0xFF2563EB)),
                  const SizedBox(height: 40),
                  _EducationCard(
                    degree: 'Bachelor of Information System (Hons.) Intelligent System Engineering',
                    institution: 'University Technology Mara, Shah Alam',
                    date: 'Mar 2024 – Mar 2026',
                    gpa: 'CGPA: 3.45 — GPA: 3.33',
                    modules: 'Oracle Database, Data Visualization with R, Expert Systems, Machine Learning, Data Mining, Fuzzy Logic, Deep Learning, Optimization Algorithms, Intelligent Decision-Making Systems, Power BI, RapidMiner (NLP)',
                  ),
                  const SizedBox(height: 30),
                  _EducationCard(
                    degree: 'Diploma in Computer Science and Mathematics',
                    institution: 'University Technology Mara, Kuala Terengganu',
                    date: 'Oct 2021 – Oct 2023',
                    gpa: 'CGPA: 3.52 (Dean\'s List)',
                    modules: 'Algorithm and Data Structures, Object-Oriented Programming, Programming Paradigm, Database Concept, Visual Programming, Computer System',
                  ),

                    const SizedBox(height: 40),
      Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 30),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.transparent,
              const Color(0xFF2563EB).withOpacity(0.05),
              const Color(0xFF2563EB).withOpacity(0.1),
            ],
          ),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: const Color(0xFF2563EB).withOpacity(0.2),
            style: BorderStyle.solid,
          ),
        ),
        child: Column(
          children: [
            // Animated dots or progress indicator
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(5, (index) {
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: index < 2 
                        ? const Color(0xFF2563EB) 
                        : const Color(0xFF2563EB).withOpacity(0.2),
                  ),
                );
              }),
            ),
            const SizedBox(height: 20),
            
            // "More coming soon" text with icon
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.construction,
                  size: 20,
                  color: const Color(0xFF2563EB).withOpacity(0.7),
                ),
                const SizedBox(width: 10),
                Text(
                  'MORE EDUCATION COMING SOON',
                  style: GoogleFonts.inter(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF2563EB).withOpacity(0.8),
                    letterSpacing: 0.5,
                  ),
                ),
                const SizedBox(width: 10),
                Icon(
                  Icons.hourglass_empty,
                  size: 20,
                  color: const Color(0xFF2563EB).withOpacity(0.7),
                ),
              ],
            ),
            
            const SizedBox(height: 10),
            
            // Subtle hint text
            Text(
              'Currently updating',
              style: GoogleFonts.inter(
                fontSize: 14,
                color: const Color(0xFF6B7280),
              ),
            ),
            
            const SizedBox(height: 20),
            
            // "View Full Resume" button (optional)
            // MouseRegion(
            //   cursor: SystemMouseCursors.click,
            //   child: GestureDetector(
            //     onTap: () {
            //       // Add your resume PDF link here
            //       // launchUrl(Uri.parse('link_to_your_resume.pdf'));
            //     },
            //     child: Container(
            //       padding: const EdgeInsets.symmetric(
            //         horizontal: 24,
            //         vertical: 12,
            //       ),
            //       decoration: BoxDecoration(
            //         color: Colors.white,
            //         borderRadius: BorderRadius.circular(30),
            //         boxShadow: [
            //           BoxShadow(
            //             color: const Color(0xFF2563EB).withOpacity(0.1),
            //             blurRadius: 10,
            //             offset: const Offset(0, 4),
            //           ),
            //         ],
            //       ),
            //       child: Row(
            //         mainAxisSize: MainAxisSize.min,
            //         children: [
            //           Text(
            //             'VIEW FULL RESUME',
            //             style: GoogleFonts.inter(
            //               fontSize: 14,
            //               fontWeight: FontWeight.w600,
            //               color: const Color(0xFF2563EB),
            //             ),
            //           ),
            //           const SizedBox(width: 8),
            //           const Icon(
            //             Icons.arrow_forward,
            //             size: 16,
            //             color: Color(0xFF2563EB),
            //           ),
            //         ],
            //       ),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
                ],
              ),
            ),

            // // Extracurricular Section
            // Container(
            //   padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 60),
            //   color: Colors.white,
            //   child: Column(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: [
            //       Text(
            //         'Extracurricular',
            //         style: GoogleFonts.inter(
            //           fontSize: 40,
            //           fontWeight: FontWeight.bold,
            //           color: const Color(0xFF111827),
            //         ),
            //       ),
            //       const SizedBox(height: 10),
            //       Container(width: 60, height: 3, color: const Color(0xFF2563EB)),
            //       const SizedBox(height: 40),
            //       _ExtracurricularCard(
            //         title: 'Deploying AI LLM-Powered Applications Workshop',
            //         role: 'Participant & Program Committee Member',
            //         location: 'Shah Alam, Selangor',
            //         date: 'Jun 2025',
            //         description: 'Assisted in program flow coordination, participant support, and floor management. Provided technical assistance in software installation and error handling during workshop sessions.',
            //       ),
            //       const SizedBox(height: 20),
            //       _ExtracurricularCard(
            //         title: 'Flood Relief Volunteer',
            //         role: 'Volunteer',
            //         location: 'Kuala Terengganu, Terengganu',
            //         date: 'Dec 2022',
            //         description: 'Assisted flood victims by cleaning and restoring homes after severe flooding. Contributed to community recovery efforts and humanitarian aid.',
            //       ),
            //     ],
            //   ),
            // ),

            // Contact Section
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 60),
              color: const Color(0xFF111827),
              child: Column(
                children: [
                  Text(
                    'Let\'s Talk',
                    style: GoogleFonts.inter(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'I have got just what you need. Lets talk.',
                    style: GoogleFonts.inter(
                      fontSize: 18,
                      color: const Color(0xFF9CA3AF),
                    ),
                  ),
                  const SizedBox(height: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _ContactInfo(
                        icon: Icons.phone,
                        info: '+601163831902',
                        onTap: () => launchUrl(Uri.parse('tel:+601163831902')),
                      ),
                      const SizedBox(width: 40),
                      _ContactInfo(
                        icon: Icons.email,
                        info: 'ilhammustaqeem8@gmail.com',
                        onTap: () => launchUrl(Uri.parse('mailto:ilhammustaqeem8@gmail.com')),
                      ),
                      const SizedBox(width: 40),
                      _ContactInfo(
                        icon: Icons.location_on,
                        info: 'Malaysia',
                        onTap: null,
                      ),
                    ],
                  ),
                  const SizedBox(height: 40),
                  const Divider(color: Color(0xFF374151)),
                  const SizedBox(height: 20),
                  Text(
                    '© 2025 Ilham Mustaqeem. All rights reserved.',
                    style: GoogleFonts.inter(
                      color: const Color(0xFF6B7280),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}



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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Navigation Bar
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'NOMAD MUSTAQEEM',
                    style: GoogleFonts.inter(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF1F2937),
                    ),
                  ),
                  Row(
                    children: [
                      _NavButton(
                        text: 'Portfolio',
                        onTap: () {
                          Navigator.pushReplacementNamed(context, '/');
                        },
                      ),
                      const SizedBox(width: 20),
                      _NavButton(
                        text: 'Personal Site',
                        onTap: () {},
                        isHighlighted: true,
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Hero Section - Personal
            Container(
              height: 300,
              padding: const EdgeInsets.symmetric(horizontal: 40),
              color: const Color(0xFFF9FAFB),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Beyond the Code',
                          style: GoogleFonts.inter(
                            fontSize: 48,
                            fontWeight: FontWeight.bold,
                            color: const Color(0xFF111827),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'My personal space - journey, adventures, and everything in between',
                          style: GoogleFonts.inter(
                            fontSize: 18,
                            color: const Color(0xFF4B5563),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: const Color(0xFFE5E7EB),
                      image: const DecorationImage(
                        image: NetworkImage('https://via.placeholder.com/150'), // Add your photo
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // SECTION 1: Personal Details (About Me)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 60),
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'About Me',
                    style: GoogleFonts.inter(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF111827),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(width: 60, height: 3, color: const Color(0xFF2563EB)),
                  const SizedBox(height: 30),
                  
                  // Personal Details Card
                  Container(
                    padding: const EdgeInsets.all(40),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF9FAFB),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: const Color(0xFFE5E7EB)),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Profile Summary
                        Expanded(
                          flex: 2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Name with greeting
                              Text(
                                'Mustaqeem',
                                style: GoogleFonts.inter(
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                  color: const Color(0xFF111827),
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                'Just a Guy From Somewhere',
                                style: GoogleFonts.inter(
                                  fontSize: 18,
                                  color: const Color.fromARGB(255, 18, 18, 19),
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(height: 24),
                              
                              // Personal Quote
                              Container(
                                padding: const EdgeInsets.all(20),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(color: const Color(0xFFE5E7EB)),
                                ),
                                child: Column(
                                  children: [
                                    Icon(
                                      Icons.format_quote,
                                      size: 40,
                                      color: const Color(0xFF2563EB).withOpacity(0.2),
                                    ),
                                    const SizedBox(height: 10),
                                    Text(
                                      '"Tidak Masalah Seberapa Lambatnya Kamu Berjalan, Yang Penting Kamu Tidak Berhenti - Confucius"',
                                      style: GoogleFonts.inter(
                                        fontSize: 16,
                                        color: const Color(0xFF4B5563),
                                        height: 1.6,
                                        fontStyle: FontStyle.italic,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 40),
                        
                        // Personal Details Grid
                        Expanded(
                          flex: 3,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Personal Information',
                                style: GoogleFonts.inter(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: const Color(0xFF111827),
                                ),
                              ),
                              const SizedBox(height: 20),
                              
                              // Details Grid
                              Wrap(
                                spacing: 20,
                                runSpacing: 20,
                                children: [
                                  _PersonalDetailCard(
                                    icon: Icons.person,
                                    label: 'Full Name',
                                    value: 'Ilham Mustaqeem',
                                  ),
                                  _PersonalDetailCard(
                                    icon: Icons.cake,
                                    label: 'Age',
                                    value: '23 years old', // Update with actual age
                                  ),
                                  _PersonalDetailCard(
                                    icon: Icons.language,
                                    label: 'Languages',
                                    value: 'Malay (Native), English (Intermidiate), German (Basic)',
                                  ),
                                 _PersonalDetailCard(
                                    icon: Icons.location_on,
                                    label: 'Roots',
                                    value: '🇲🇾 Selangor, Malaysia | 🇹🇭 Kanchanaburi, Thailand',
                                  ),
                                  _PersonalDetailCard(
                                    icon: Icons.school,
                                    label: 'Education',
                                    value: 'BIS Intelligent System Engineering, UiTM',
                                  ),
                                  _PersonalDetailCard(
                                    icon: Icons.work,
                                    label: 'Current Role',
                                    value: '-',
                                  ),
                                  _PersonalDetailCard(
                                    icon: Icons.favorite,
                                    label: 'Passions',
                                    value: 'Technology, Travel',
                                  ),
                                  _PersonalDetailCard(
                                    icon: Icons.music_note,
                                    label: 'Hobbies',
                                    value: 'Anything got me sweat',
                                  ),
                                ],
                              ),
                              
                              const SizedBox(height: 30),
                              
                              // Personal Mission
                              Container(
                                padding: const EdgeInsets.all(20),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(color: const Color(0xFFE5E7EB)),
                                ),
                                child: Row(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(12),
                                      decoration: BoxDecoration(
                                        color: const Color.fromARGB(255, 16, 16, 17).withOpacity(0.1),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: const Icon(
                                        Icons.flag,
                                        color: Color.fromARGB(255, 19, 19, 20),
                                        size: 24,
                                      ),
                                    ),
                                    const SizedBox(width: 16),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'My Mission',
                                            style: GoogleFonts.inter(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600,
                                              color: const Color.fromARGB(255, 22, 23, 23),
                                            ),
                                          ),
                                          const SizedBox(height: 4),
                                          Text(
                                            'Explore each country on earth',
                                            style: GoogleFonts.inter(
                                              fontSize: 14,
                                              color: const Color(0xFF4B5563),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // SECTION 2: Sports & Activities (4 Flip Cards in a Row)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 60),
              color: const Color(0xFFF9FAFB),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Sports & Activities',
                    style: GoogleFonts.inter(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF111827),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(width: 60, height: 3, color: const Color(0xFF2563EB)),
                  const SizedBox(height: 30),
                  
                  // Four Flip Cards in a Row
                  SizedBox(
                    height: 550, // Fixed height for the row
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
                                  description: 'I started running to stay fit, but it became a passion. I do both regular road running and trail running. The trails call to me — the mud, the hills, the forest. My first big challenge is coming up: a 30km+ trail run in Negeri Sembilan, July 2026.',
                                  achievements: [
                                    '🎽 Regular runner: 10-15km weekly',
                                    '🏃 Trail runner: Exploring forest trails',
                                    '🌲 First trail event: July 2026 (30km+)',
                                    '📍 Negeri Sembilan trail run (upcoming)',
                                    '⏱️ 5km PB: 24 minutes',
                                  ],
                                  stats: 'Road & Trail | 30km+ event soon',
                                ),
                                backContent: _SportBackCard(
                                  title: 'Running Gallery',
                                  images: [
                                    'https://images.unsplash.com/photo-1476480862126-209bfaa8edc4?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=80',
                                    'https://images.unsplash.com/photo-1551698618-1dfe5d97d256?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=80',
                                    'https://images.unsplash.com/photo-1461896836934-ffe607ba8211?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=80',
                                    'https://images.unsplash.com/photo-1530549387789-4c1017266635?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=80',
                                  ],
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
                                    '🚵 MTB: Conquered Bukit Cherakah trails',
                                    '🚴 Road bike: Century ride (100km+)',
                                    '🏆 Local event finisher: Bentong - Genting',
                                    '⛰️ Climbed Fraser Hill on bike',
                                    '🏅 Weekend Warrior Club member',
                                  ],
                                  stats: 'MTB & Road Bike | 100km+ rides',
                                ),
                                backContent: _SportBackCard(
                                  title: 'Biking Gallery',
                                  images: [
                                    'https://images.unsplash.com/photo-1511994298241-608e28f14fde?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=80',
                                    'https://images.unsplash.com/photo-1541625602330-2277a4c46182?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=80',
                                    'https://images.unsplash.com/photo-1571066811602-716dc42e89c0?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=80',
                                    'https://images.unsplash.com/photo-1527529482837-4698179dc6ce?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=80',
                                  ],
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
                                  description: 'The ocean is my second home. Every monsoon season in Terengganu, I hit the waves. Still learning, still improving. No achievements yet — just the joy of catching a good wave and the endless pursuit of better skills.',
                                  achievements: [
                                    '🏄‍♂️ Surfing since 2022',
                                    '🌊 Monsoon season regular at Terengganu',
                                    '🔄 Working on: Pop-up & wave selection',
                                    '🎯 Goal: Ride unbroken waves consistently',
                                    '🤙 Beach clean-up volunteer',
                                  ],
                                  stats: 'Beginner → Intermediate | Monsoon surfer',
                                ),
                                backContent: _SportBackCard(
                                  title: 'Surfing Gallery',
                                  images: [
                                    'https://images.unsplash.com/photo-1502680390469-be75c86b636f?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=80',
                                    'https://images.unsplash.com/photo-1623557366923-3f981e3f7f8f?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=80',
                                    'https://images.unsplash.com/photo-1625711147529-e2ec97cf9da5?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=80',
                                    'https://images.unsplash.com/photo-1516939884455-1445c8652f83?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=80',
                                  ],
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
                                    '🇮🇩 Indonesia: Jakarta, Bandung',
                                    '🏝️ Island collector: 10+ islands visited',
                                  ],
                                  stats: 'Solo traveller | 3 countries | 15+ destinations',
                                ),
                                backContent: _SportBackCard(
                                  title: 'Travel Gallery',
                                  images: [
                                    'https://images.unsplash.com/photo-1469474968028-56623f02e42e?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=80',
                                    'https://images.unsplash.com/photo-1507525425510-1f2d39962a4c?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=80',
                                    'https://images.unsplash.com/photo-1519046904884-53103b34b206?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=80',
                                    'https://images.unsplash.com/photo-1501785888041-af3ef285b470?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=80',
                                  ],
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

        // SECTION 3: Next Adventures & Projects (Redesigned with Map)
Container(
  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 60),
  color: Colors.white,
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        'Next Adventures & Projects',
        style: GoogleFonts.inter(
          fontSize: 32,
          fontWeight: FontWeight.bold,
          color: const Color(0xFF111827),
        ),
      ),
      const SizedBox(height: 10),
      Container(width: 60, height: 3, color: const Color(0xFF2563EB)),
      const SizedBox(height: 40),
      
      // Two-Column Layout: Left side - Map | Right side - Details
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // LEFT COLUMN: Map Visualization (40% width)
          // LEFT COLUMN: Live Map (40% width)
Expanded(
  flex: 4,
  child: Container(
    height: 600, // Fixed height for map
    padding: const EdgeInsets.all(24),
    decoration: BoxDecoration(
      color: const Color(0xFFF9FAFB),
      borderRadius: BorderRadius.circular(20),
      border: Border.all(color: const Color(0xFFE5E7EB)),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Map Header
        Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: const Color(0xFF2563EB).withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(
                Icons.map,
                color: Color(0xFF2563EB),
                size: 20,
              ),
            ),
            const SizedBox(width: 12),
            Text(
              'Eurasian Trip 2028',
              style: GoogleFonts.inter(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: const Color(0xFF111827),
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        
        // Live Interactive Map
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: _ExpeditionMap(),
          ),
        ),
        
        const SizedBox(height: 24),
        
        // Route Statistics (keep as is)
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: const Color(0xFFE5E7EB)),
          ),
          child: Column(
            // ... your existing stats content
          ),
        ),
      ],
    ),
  ),
),
          
          const SizedBox(width: 30),
          
          // RIGHT COLUMN: Adventure Details (60% width)
          Expanded(
            flex: 6,
            child: Column(
              children: [
                // First Adventure (Trail Run)
                _ModernAdventureCard(
                  title: 'First Trail Run Event',
                  date: 'July 2026',
                  duration: '30km+',
                  location: 'Negeri Sembilan',
                  imageUrl: 'https://images.unsplash.com/photo-1551698618-1dfe5d97d256?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=80',
                  description: 'My first official trail running event! Training hard for this 30km+ challenge through the beautiful trails of Negeri Sembilan.',
                  highlights: const [
                    'Weekend trail runs',
                    'Hill endurance training',
                    'Route study & elevation',
                    'Goal: Finish strong',
                  ],
                  status: 'Training Phase',
                  progress: 0.4,
                  color: const Color(0xFF10B981),
                ),
                
                const SizedBox(height: 24),
                
                // Second Adventure (The Great Expedition) - HIGHLIGHTED
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        const Color(0xFF2563EB).withOpacity(0.05),
                        Colors.white,
                        const Color(0xFF2563EB).withOpacity(0.05),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: const Color(0xFF2563EB).withOpacity(0.3),
                      width: 2,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFF2563EB).withOpacity(0.1),
                        spreadRadius: 4,
                        blurRadius: 12,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: _ExpeditionDetailCard(
                    title: 'Eurasian Overland Expedition',
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
        ],
      ),
    ],
  ),
),




            

            // Footer
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 30),
              color: const Color(0xFF111827),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '© 2025 Ilham Mustaqeem. All rights reserved.',
                    style: GoogleFonts.inter(
                      color: const Color(0xFF6B7280),
                    ),
                  ),
                  Row(
                    children: [
                      IconButton(
                        icon: const FaIcon(FontAwesomeIcons.github, color: Color(0xFF9CA3AF), size: 20),
                        onPressed: () => launchUrl(Uri.parse('https://github.com/ilham-mustaqeem')),
                      ),
                      const SizedBox(width: 10),
                      IconButton(
                        icon: const FaIcon(FontAwesomeIcons.linkedin, color: Color(0xFF9CA3AF), size: 20),
                        onPressed: () => launchUrl(Uri.parse('https://www.linkedin.com/in/ilham-mustaqeem-130797269/')),
                      ),
                      const SizedBox(width: 10),
                      IconButton(
                        icon: const FaIcon(FontAwesomeIcons.instagram, color: Color(0xFF9CA3AF), size: 20),
                        onPressed: () => launchUrl(Uri.parse('https://instagram.com/ilham_mustaqeem')),
                      ),
                    ],
                  ),
                ],
              ),
            ),
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
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
        border: Border.all(color: const Color(0xFFE5E7EB)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title and Icon (Fixed at top)
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 4, 4, 4).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(icon, size: 28, color: const Color.fromARGB(255, 10, 10, 10)),
              ),
              const SizedBox(width: 16),
              Text(
                title,
                style: GoogleFonts.inter(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF111827),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          
          // Stats (Fixed)
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: const Color(0xFFF3F4F6),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              stats,
              style: GoogleFonts.inter(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: const Color.fromARGB(255, 14, 14, 14),
              ),
            ),
          ),
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
                    style: GoogleFonts.inter(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF1F2937),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    description,
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      color: const Color(0xFF4B5563),
                      height: 1.6,
                    ),
                  ),
                  const SizedBox(height: 16),
                  
                  // Achievements
                  Text(
                    'Achievements',
                    style: GoogleFonts.inter(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF1F2937),
                    ),
                  ),
                  const SizedBox(height: 8),
                  
                  // Achievements List (Now scrollable within the Expanded)
                  ...achievements.map((achievement) => Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '•',
                          style: GoogleFonts.inter(
                            fontSize: 16,
                            color: const Color.fromARGB(255, 2, 2, 2),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            achievement,
                            style: GoogleFonts.inter(
                              fontSize: 13,
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
          ),
          
          const SizedBox(height: 8),
          
          // Flip Hint (Fixed at bottom)
          Center(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: const Color(0xFFF3F4F6),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.touch_app,
                    size: 14,
                    color: const Color(0xFF9CA3AF),
                  ),
                  const SizedBox(width: 4),
                  Text(
                    'Tap to see gallery',
                    style: GoogleFonts.inter(
                      fontSize: 11,
                      color: const Color(0xFF9CA3AF),
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
        color: const Color(0xFF1F2937),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title
          Text(
            title,
            style: GoogleFonts.inter(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 16),
          
          // Image Collage Grid
          Expanded(
            child: GridView.count(
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              children: images.map((imageUrl) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    imageUrl,
                    fit: BoxFit.cover,
                  ),
                );
              }).toList(),
            ),
          ),
          
          const SizedBox(height: 12),
          
          // Caption
          Text(
            caption,
            style: GoogleFonts.inter(
              fontSize: 12,
              color: Colors.white70,
              fontStyle: FontStyle.italic,
            ),
            textAlign: TextAlign.center,
          ),
          
          const SizedBox(height: 8),
          
          // Back Hint
          Center(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.touch_app,
                    size: 14,
                    color: Colors.white70,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    'Tap for story',
                    style: GoogleFonts.inter(
                      fontSize: 11,
                      color: Colors.white70,
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

// Adventure Detail Card
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

// // New Widget: Detailed Adventure Card
// class _AdventureDetailCard extends StatelessWidget {
//   final String title;
//   final String date;
//   final String duration;
//   final String location;
//   final String imageUrl;
//   final String description;
//   final List<String> highlights;
//   final String status;
//   final double progress;
//   final bool isExpanded;
//   final VoidCallback onTap;

//   const _AdventureDetailCard({
//     required this.title,
//     required this.date,
//     required this.duration,
//     required this.location,
//     required this.imageUrl,
//     required this.description,
//     required this.highlights,
//     required this.status,
//     required this.progress,
//     required this.isExpanded,
//     required this.onTap,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTap,
//       child: AnimatedContainer(
//         duration: const Duration(milliseconds: 300),
//         curve: Curves.easeInOut,
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(16),
//           boxShadow: [
//             BoxShadow(
//               color: isExpanded 
//                   ? const Color(0xFF2563EB).withOpacity(0.15)
//                   : Colors.grey.withOpacity(0.08),
//               spreadRadius: isExpanded ? 4 : 1,
//               blurRadius: isExpanded ? 8 : 4,
//               offset: const Offset(0, 2),
//             ),
//           ],
//           border: Border.all(
//             color: isExpanded ? const Color(0xFF2563EB) : const Color(0xFFE5E7EB),
//             width: isExpanded ? 2 : 1,
//           ),
//         ),
//         child: Column(
//           children: [
//             // Header with Image
//             ClipRRect(
//               borderRadius: const BorderRadius.vertical(
//                 top: Radius.circular(16),
//               ),
//               child: Stack(
//                 children: [
//                   Image.network(
//                     imageUrl,
//                     height: 150,
//                     width: double.infinity,
//                     fit: BoxFit.cover,
//                   ),
//                   Container(
//                     height: 150,
//                     decoration: BoxDecoration(
//                       gradient: LinearGradient(
//                         begin: Alignment.topCenter,
//                         end: Alignment.bottomCenter,
//                         colors: [
//                           Colors.transparent,
//                           Colors.black.withOpacity(0.8),
//                         ],
//                       ),
//                     ),
//                   ),
//                   Positioned(
//                     bottom: 16,
//                     left: 16,
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           title,
//                           style: GoogleFonts.inter(
//                             fontSize: 22,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.white,
//                           ),
//                         ),
//                         const SizedBox(height: 4),
//                         Row(
//                           children: [
//                             Icon(Icons.calendar_today, size: 14, color: Colors.white70),
//                             const SizedBox(width: 4),
//                             Text(date, style: const TextStyle(color: Colors.white70, fontSize: 12)),
//                             const SizedBox(width: 16),
//                             Icon(Icons.location_on, size: 14, color: Colors.white70),
//                             const SizedBox(width: 4),
//                             Text(location, style: const TextStyle(color: Colors.white70, fontSize: 12)),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
            
//             // Basic Info (Always Visible)
//             Padding(
//               padding: const EdgeInsets.all(20),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   // Status and Progress
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Container(
//                         padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
//                         decoration: BoxDecoration(
//                           color: _getStatusColor(status).withOpacity(0.1),
//                           borderRadius: BorderRadius.circular(20),
//                         ),
//                         child: Text(
//                           status,
//                           style: GoogleFonts.inter(
//                             fontSize: 12,
//                             fontWeight: FontWeight.w600,
//                             color: _getStatusColor(status),
//                           ),
//                         ),
//                       ),
//                       Text(
//                         duration,
//                         style: GoogleFonts.inter(
//                           fontSize: 12,
//                           color: const Color(0xFF6B7280),
//                         ),
//                       ),
//                     ],
//                   ),
                  
//                   const SizedBox(height: 12),
                  
//                   // Progress Bar
//                   Row(
//                     children: [
//                       Expanded(
//                         child: ClipRRect(
//                           borderRadius: BorderRadius.circular(10),
//                           child: LinearProgressIndicator(
//                             value: progress,
//                             backgroundColor: const Color(0xFFF3F4F6),
//                             valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFF2563EB)),
//                             minHeight: 6,
//                           ),
//                         ),
//                       ),
//                       const SizedBox(width: 12),
//                       Text(
//                         '${(progress * 100).toInt()}%',
//                         style: GoogleFonts.inter(
//                           fontSize: 12,
//                           fontWeight: FontWeight.w600,
//                           color: const Color(0xFF2563EB),
//                         ),
//                       ),
//                     ],
//                   ),
                  
//                   const SizedBox(height: 12),
                  
//                   // Description
//                   Text(
//                     description,
//                     style: GoogleFonts.inter(
//                       fontSize: 14,
//                       color: const Color(0xFF4B5563),
//                       height: 1.5,
//                     ),
//                   ),
                  
//                   // Expanded Details (shown when selected)
//                   if (isExpanded) ...[
//                     const SizedBox(height: 20),
//                     const Divider(color: Color(0xFFE5E7EB)),
//                     const SizedBox(height: 16),
                    
//                     Text(
//                       'Highlights & Plans',
//                       style: GoogleFonts.inter(
//                         fontSize: 16,
//                         fontWeight: FontWeight.bold,
//                         color: const Color(0xFF111827),
//                       ),
//                     ),
//                     const SizedBox(height: 12),
                    
//                     ...highlights.map((highlight) => Padding(
//                       padding: const EdgeInsets.only(bottom: 8),
//                       child: Row(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Icon(
//                             Icons.check_circle,
//                             size: 18,
//                             color: const Color(0xFF10B981),
//                           ),
//                           const SizedBox(width: 12),
//                           Expanded(
//                             child: Text(
//                               highlight,
//                               style: GoogleFonts.inter(
//                                 fontSize: 14,
//                                 color: const Color(0xFF4B5563),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     )),
                    
//                     const SizedBox(height: 16),
                    
//                     // Expand/Collapse indicator
//                     Center(
//                       child: Icon(
//                         Icons.keyboard_arrow_up,
//                         color: const Color(0xFF2563EB),
//                       ),
//                     ),
//                   ] else
//                     // Expand indicator
//                     Center(
//                       child: Icon(
//                         Icons.keyboard_arrow_down,
//                         color: const Color(0xFF9CA3AF),
//                       ),
//                     ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Color _getStatusColor(String status) {
//     switch (status) {
//       case 'Planning Phase':
//         return const Color(0xFFF59E0B);
//       case 'Training Phase':
//         return const Color(0xFF10B981);
//       case 'In Progress':
//         return const Color(0xFF2563EB);
//       default:
//         return const Color(0xFF6B7280);
//     }
//   }
// }

// Custom Widgets
class _NavButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final bool isHighlighted;

  const _NavButton({
    required this.text,
    required this.onTap,
    this.isHighlighted = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: isHighlighted
            ? BoxDecoration(
                color: const Color.fromARGB(255, 17, 17, 17),
                borderRadius: BorderRadius.circular(20),
              )
            : null,
        child: Text(
          text,
          style: GoogleFonts.inter(
            fontSize: 16,
            fontWeight: isHighlighted ? FontWeight.w600 : FontWeight.w500,
            color: isHighlighted ? Colors.white : const Color(0xFF4B5563),
          ),
        ),
      ),
    );
  }
}

class _SocialIconButton extends StatelessWidget {
  final IconData icon;
  final String url;
  final Color color;

  const _SocialIconButton({
    required this.icon,
    required this.url,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        if (await canLaunchUrl(Uri.parse(url))) {
          await launchUrl(Uri.parse(url));
        }
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: const Color(0xFFF3F4F6),
        ),
        child: FaIcon(icon, color: color, size: 20),
      ),
    );
  }
}

class _ExperienceCard extends StatelessWidget {
  final String title;
  final String company;
  final String location;
  final String date;
  final List<String> bullets;

  const _ExperienceCard({
    required this.title,
    required this.company,
    required this.location,
    required this.date,
    required this.bullets,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.05),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: GoogleFonts.inter(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF111827),
            ),
          ),
          const SizedBox(height: 5),
          Row(
            children: [
              Text(
                company,
                style: GoogleFonts.inter(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: const Color.fromARGB(255, 20, 20, 20),
                ),
              ),
              const SizedBox(width: 20),
              Icon(Icons.location_on, size: 14, color: const Color(0xFF6B7280)),
              const SizedBox(width: 5),
              Text(
                location,
                style: GoogleFonts.inter(
                  fontSize: 14,
                  color: const Color(0xFF6B7280),
                ),
              ),
              const SizedBox(width: 20),
              Icon(Icons.calendar_today, size: 14, color: const Color(0xFF6B7280)),
              const SizedBox(width: 5),
              Text(
                date,
                style: GoogleFonts.inter(
                  fontSize: 14,
                  color: const Color(0xFF6B7280),
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          ...bullets.map((bullet) => Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('• ', style: TextStyle(fontSize: 16, color: const Color(0xFF4B5563))),
                Expanded(
                  child: Text(
                    bullet,
                    style: GoogleFonts.inter(
                      fontSize: 16,
                      color: const Color(0xFF4B5563),
                      height: 1.5,
                    ),
                  ),
                ),
              ],
            ),
          )),
        ],
      ),
    );
  }
}

class _ProjectCard extends StatelessWidget {
  final String title;
  final String technologies;
  final String description;
  final String achievement;

  const _ProjectCard({
    required this.title,
    required this.technologies,
    required this.description,
    required this.achievement,
  });

  @override
  Widget build(BuildContext context) {
    // Calculate card width based on screen size
    double screenWidth = MediaQuery.of(context).size.width;
    double cardWidth = (screenWidth - 170) / 4; // 4 cards with padding and spacing
    
    // For smaller screens, adjust width
    if (screenWidth < 1200) {
      cardWidth = 280; // Fixed width for smaller screens
    }

    return Container(
      width: cardWidth,
      height: 400, // FIXED HEIGHT for all cards
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.08),
            spreadRadius: 1,
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min, // This is important
        children: [
          // Title Section - Fixed height
          Container(
            height: 120,
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Color(0xFFF3F4F6), width: 1),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.inter(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF111827),
                    height: 1.3,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF3F4F6),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Text(
                    technologies,
                    style: GoogleFonts.inter(
                      fontSize: 10,
                      color: const Color(0xFF4B5563),
                      fontWeight: FontWeight.w500,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
          
          // Description Section - Fixed height
          Container(
            height: 140,
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Color(0xFFF3F4F6), width: 1),
              ),
            ),
            child: Text(
              description,
              style: GoogleFonts.inter(
                fontSize: 13,
                color: const Color(0xFF6B7280),
                height: 1.5,
              ),
              maxLines: 5,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          
          // Achievement Section - Fixed height
          Container(
            height: 80,
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Container(
                  width: 4,
                  height: 40,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 12, 12, 12),
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    achievement,
                    style: GoogleFonts.inter(
                      fontSize: 12,
                      color: const Color.fromARGB(255, 10, 11, 11),
                      fontWeight: FontWeight.w500,
                      height: 1.4,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
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


class _SkillChip extends StatelessWidget {
  final String label;
  final double proficiency;

  const _SkillChip(this.label, this.proficiency);

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: '${(proficiency * 100).toInt()}% proficient',
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          color: const Color(0xFFF3F4F6),
          borderRadius: BorderRadius.circular(25),
        ),
        child: Text(
          label,
          style: GoogleFonts.inter(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: const Color(0xFF1F2937),
          ),
        ),
      ),
    );
  }
}

class _EducationCard extends StatelessWidget {
  final String degree;
  final String institution;
  final String date;
  final String gpa;
  final String modules;

  const _EducationCard({
    required this.degree,
    required this.institution,
    required this.date,
    required this.gpa,
    required this.modules,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.05),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            degree,
            style: GoogleFonts.inter(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF111827),
            ),
          ),
          const SizedBox(height: 5),
          Row(
            children: [
              Icon(Icons.school, size: 16, color: const Color(0xFF6B7280)),
              const SizedBox(width: 5),
              Text(
                institution,
                style: GoogleFonts.inter(
                  fontSize: 14,
                  color: const Color(0xFF6B7280),
                ),
              ),
              const SizedBox(width: 20),
              Icon(Icons.calendar_today, size: 16, color: const Color(0xFF6B7280)),
              const SizedBox(width: 5),
              Text(
                date,
                style: GoogleFonts.inter(
                  fontSize: 14,
                  color: const Color(0xFF6B7280),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
              color: const Color(0xFFF3F4F6),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Text(
              gpa,
              style: GoogleFonts.inter(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: const Color(0xFF1F2937),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            'Related Modules:',
            style: GoogleFonts.inter(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF1F2937),
            ),
          ),
          const SizedBox(height: 5),
          Text(
            modules,
            style: GoogleFonts.inter(
              fontSize: 14,
              color: const Color(0xFF4B5563),
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}

class _ExtracurricularCard extends StatelessWidget {
  final String title;
  final String role;
  final String location;
  final String date;
  final String description;

  const _ExtracurricularCard({
    required this.title,
    required this.role,
    required this.location,
    required this.date,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xFFE5E7EB)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: GoogleFonts.inter(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF111827),
            ),
          ),
          const SizedBox(height: 5),
          Row(
            children: [
              Text(
                role,
                style: GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: const Color.fromARGB(255, 17, 17, 17),
                ),
              ),
              const SizedBox(width: 20),
              Icon(Icons.location_on, size: 14, color: const Color(0xFF6B7280)),
              const SizedBox(width: 5),
              Text(
                location,
                style: GoogleFonts.inter(
                  fontSize: 14,
                  color: const Color(0xFF6B7280),
                ),
              ),
              const SizedBox(width: 20),
              Icon(Icons.calendar_today, size: 14, color: const Color(0xFF6B7280)),
              const SizedBox(width: 5),
              Text(
                date,
                style: GoogleFonts.inter(
                  fontSize: 14,
                  color: const Color(0xFF6B7280),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            description,
            style: GoogleFonts.inter(
              fontSize: 14,
              color: const Color(0xFF4B5563),
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}

class _ContactInfo extends StatelessWidget {
  final IconData icon;
  final String info;
  final VoidCallback? onTap;

  const _ContactInfo({
    required this.icon,
    required this.info,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Icon(icon, color: const Color(0xFF9CA3AF), size: 20),
          const SizedBox(width: 10),
          Text(
            info,
            style: GoogleFonts.inter(
              fontSize: 16,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

// Personal Page Widgets
class _PersonalTimelineItem extends StatelessWidget {
  final String year;
  final String title;
  final String description;
  final IconData icon;

  const _PersonalTimelineItem({
    required this.year,
    required this.title,
    required this.description,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: const Color(0xFFF3F4F6),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: const Color.fromARGB(255, 22, 22, 23), size: 30),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  year,
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: const Color.fromARGB(255, 10, 10, 10),
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  title,
                  style: GoogleFonts.inter(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF111827),
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  description,
                  style: GoogleFonts.inter(
                    fontSize: 16,
                    color: const Color(0xFF4B5563),
                    height: 1.5,
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

class _PersonalProjectCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String description;
  final IconData icon;
  final Color color;

  const _PersonalProjectCard({
    required this.title,
    required this.subtitle,
    required this.description,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.05),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: FaIcon(icon, color: color, size: 24),
          ),
          const SizedBox(height: 20),
          Text(
            title,
            style: GoogleFonts.inter(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF111827),
            ),
          ),
          const SizedBox(height: 5),
          Text(
            subtitle,
            style: GoogleFonts.inter(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: color,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            description,
            style: GoogleFonts.inter(
              fontSize: 14,
              color: const Color(0xFF6B7280),
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}

class _InterestChip extends StatelessWidget {
  final String label;
  final Color color;

  const _InterestChip({
    required this.label,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Text(
        label,
        style: GoogleFonts.inter(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: color,
        ),
      ),
    );
  }
}

// Add this at the bottom of your file, after _InterestChip widget but before the final closing brace

// ANIMATED PROFILE IMAGE WIDGET - OPTION 2
class AnimatedProfileImage extends StatefulWidget {
  @override
  _AnimatedProfileImageState createState() => _AnimatedProfileImageState();
}

class _AnimatedProfileImageState extends State<AnimatedProfileImage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _pulseAnimation;
  late Animation<double> _rotateAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 4),
      vsync: this,
    )..repeat(reverse: true);

    _pulseAnimation = Tween<double>(begin: 1.0, end: 1.05).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );

    _rotateAnimation = Tween<double>(begin: -0.02, end: 0.02).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Transform.rotate(
          angle: _rotateAnimation.value,
          child: Transform.scale(
            scale: _pulseAnimation.value,
            child: Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xFFF3F4F6),
                image: const DecorationImage(
                  image: NetworkImage('https://via.placeholder.com/300'),
                  fit: BoxFit.cover,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    spreadRadius: 2,
                    blurRadius: 15,
                    offset: const Offset(0, 8),
                  ),
                ],
                border: Border.all(
                  color: Colors.white,
                  width: 4,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}


// Custom Map Painter for Route Line
class _RouteMapPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFF2563EB)
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke;

    final dotPaint = Paint()
      ..color = const Color(0xFF2563EB)
      ..style = PaintingStyle.fill;

    // Define route points (relative coordinates 0-1)
    final points = [
      Offset(0.75, 0.85), // Malaysia
      Offset(0.55, 0.35), // Mongolia
      Offset(0.65, 0.40), // China
      Offset(0.50, 0.45), // Kyrgyzstan
      Offset(0.45, 0.55), // Pakistan
      Offset(0.25, 0.60), // Bosnia
    ];

    // Scale points to canvas size
    final scaledPoints = points.map((p) => Offset(p.dx * size.width, p.dy * size.height)).toList();

    // Draw connecting lines
    for (int i = 0; i < scaledPoints.length - 1; i++) {
      canvas.drawLine(scaledPoints[i], scaledPoints[i + 1], paint);
    }

    // Draw dots at each location
    for (final point in scaledPoints) {
      canvas.drawCircle(point, 6, dotPaint);
      // White inner circle for highlight
      canvas.drawCircle(
        point, 
        3, 
        Paint()..color = Colors.white..style = PaintingStyle.fill,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

// Map Markers Builder
List<Widget> _buildMapMarkers() {
  const markers = [
    {'name': 'Malaysia', 'left': 0.72, 'top': 0.82, 'color': Color(0xFF2563EB)},
    {'name': 'Mongolia', 'left': 0.52, 'top': 0.32, 'color': Color(0xFFF59E0B)},
    {'name': 'China', 'left': 0.62, 'top': 0.37, 'color': Color(0xFF10B981)},
    {'name': 'Kyrgyzstan', 'left': 0.47, 'top': 0.42, 'color': Color(0xFF8B5CF6)},
    {'name': 'Pakistan', 'left': 0.42, 'top': 0.52, 'color': Color(0xFFEC4899)},
    {'name': 'Bosnia', 'left': 0.22, 'top': 0.57, 'color': Color(0xFFEF4444)},
  ];

  return markers.map((marker) {
    return Positioned(
      left: (marker['left'] as double) * 300, // Approximate width
      top: (marker['top'] as double) * 300, // Approximate height
      child: Tooltip(
        message: marker['name'] as String,
        child: Container(
          width: 24,
          height: 24,
          decoration: BoxDecoration(
            color: (marker['color'] as Color).withOpacity(0.2),
            shape: BoxShape.circle,
            border: Border.all(
              color: marker['color'] as Color,
              width: 2,
            ),
          ),
          child: Center(
            child: Container(
              width: 8,
              height: 8,
              decoration: BoxDecoration(
                color: marker['color'] as Color,
                shape: BoxShape.circle,
              ),
            ),
          ),
        ),
      ),
    );
  }).toList();
}

// Stat Pill Widget
class _StatPill extends StatelessWidget {
  final IconData icon;
  final String value;
  final String label;

  const _StatPill({
    required this.icon,
    required this.value,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: const Color(0xFF2563EB).withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: const Color(0xFF2563EB), size: 20),
        ),
        const SizedBox(height: 8),
        Text(
          value,
          style: GoogleFonts.inter(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: const Color(0xFF111827),
          ),
        ),
        Text(
          label,
          style: GoogleFonts.inter(
            fontSize: 12,
            color: const Color(0xFF6B7280),
          ),
        ),
      ],
    );
  }
}

// Route Segment Widget
class _RouteSegment extends StatelessWidget {
  final Color color;
  final String label;
  final String location;
  final String? duration;
  final IconData? icon;

  const _RouteSegment({
    required this.color,
    required this.label,
    required this.location,
    this.duration,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              shape: BoxShape.circle,
              border: Border.all(color: color, width: 2),
            ),
            child: icon != null
                ? Icon(icon, color: color, size: 16)
                : Center(
                    child: Container(
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                        color: color,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: GoogleFonts.inter(
              fontSize: 10,
              fontWeight: FontWeight.w600,
              color: color,
            ),
          ),
          Text(
            location,
            style: GoogleFonts.inter(
              fontSize: 11,
              fontWeight: FontWeight.w500,
              color: const Color(0xFF1F2937),
            ),
          ),
          if (duration != null)
            Text(
              duration!,
              style: GoogleFonts.inter(
                fontSize: 9,
                color: const Color(0xFF6B7280),
              ),
            ),
        ],
      ),
    );
  }
}

// Modern Adventure Card (for smaller adventures)
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
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE5E7EB)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.05),
            spreadRadius: 2,
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
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
                  height: 120,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                Container(
                  height: 120,
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
                  left: 16,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: GoogleFonts.inter(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Row(
                        children: [
                          Icon(Icons.calendar_today, size: 12, color: Colors.white70),
                          const SizedBox(width: 4),
                          Text(date, style: const TextStyle(color: Colors.white70, fontSize: 11)),
                          const SizedBox(width: 12),
                          Icon(Icons.location_on, size: 12, color: Colors.white70),
                          const SizedBox(width: 4),
                          Text(location, style: const TextStyle(color: Colors.white70, fontSize: 11)),
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
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Status Badge and Progress
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: color.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        status,
                        style: GoogleFonts.inter(
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                          color: color,
                        ),
                      ),
                    ),
                    Text(
                      duration,
                      style: GoogleFonts.inter(
                        fontSize: 11,
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
                          valueColor: AlwaysStoppedAnimation<Color>(color),
                          minHeight: 4,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      '${(progress * 100).toInt()}%',
                      style: GoogleFonts.inter(
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                        color: color,
                      ),
                    ),
                  ],
                ),
                
                const SizedBox(height: 12),
                
                // Description
                Text(
                  description,
                  style: GoogleFonts.inter(
                    fontSize: 13,
                    color: const Color(0xFF4B5563),
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Expedition Detail Card (for the main journey)
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
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title Section
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: const Color(0xFF2563EB).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(
                  Icons.explore,
                  color: Color(0xFF2563EB),
                  size: 24,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: GoogleFonts.inter(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF111827),
                      ),
                    ),
                    Text(
                      subtitle,
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        color: const Color(0xFF2563EB),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: const Color(0xFFF59E0B).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  duration,
                  style: GoogleFonts.inter(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFFF59E0B),
                  ),
                ),
              ),
            ],
          ),
          
          const SizedBox(height: 20),
          
          // Stats Grid
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xFFF9FAFB),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Wrap(
              spacing: 16,
              runSpacing: 16,
              children: stats.entries.map((entry) {
                return SizedBox(
                  width: 100,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        entry.key,
                        style: GoogleFonts.inter(
                          fontSize: 11,
                          color: const Color(0xFF6B7280),
                        ),
                      ),
                      Text(
                        entry.value,
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFF111827),
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
          
          const SizedBox(height: 20),
          
          // Description
          Text(
            description,
            style: GoogleFonts.inter(
              fontSize: 14,
              color: const Color(0xFF4B5563),
              height: 1.6,
            ),
          ),
          
          const SizedBox(height: 20),
          
          // Itinerary Timeline
          Text(
            'Expedition Itinerary',
            style: GoogleFonts.inter(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: const Color(0xFF111827),
            ),
          ),
          const SizedBox(height: 16),
          
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

class _ExpeditionMap extends StatefulWidget {
  @override
  State<_ExpeditionMap> createState() => _ExpeditionMapState();
}

class _ExpeditionMapState extends State<_ExpeditionMap> {
  final MapController _mapController = MapController();
  
  // Define route points with real coordinates
  final List<LatLng> _routePoints = const [
    LatLng(3.1390, 101.6869), // Malaysia (Kuala Lumpur)
    LatLng(47.8864, 106.9057), // Mongolia (Ulaanbaatar)
    LatLng(39.9042, 116.4074), // China (Beijing)
    LatLng(42.8746, 74.5698),  // Kyrgyzstan (Bishkek)
    LatLng(33.6844, 73.0479),  // Pakistan (Islamabad)
    LatLng(43.8563, 18.4131),  // Bosnia (Sarajevo)
  ];

  // Define markers with custom info
  final List<_RouteMarker> _markers = const [
    _RouteMarker(
      name: '🇲🇾 Malaysia',
      location: 'Kuala Lumpur',
      coordinates: LatLng(3.1390, 101.6869),
      color: Color(0xFF2563EB),
      duration: 'Starting Point',
    ),
    _RouteMarker(
      name: '🇲🇳 Mongolia',
      location: 'Ulaanbaatar',
      coordinates: LatLng(47.8864, 106.9057),
      color: Color(0xFFF59E0B),
      duration: '2 months',
    ),
    _RouteMarker(
      name: '🇨🇳 China',
      location: 'Beijing',
      coordinates: LatLng(39.9042, 116.4074),
      color: Color(0xFF10B981),
      duration: '3 months',
    ),
    _RouteMarker(
      name: '🇰🇬 Kyrgyzstan',
      location: 'Bishkek',
      coordinates: LatLng(42.8746, 74.5698),
      color: Color(0xFF8B5CF6),
      duration: '4 months',
    ),
    _RouteMarker(
      name: '🇵🇰 Pakistan',
      location: 'Islamabad',
      coordinates: LatLng(33.6844, 73.0479),
      color: Color(0xFFEC4899),
      duration: '2 months',
    ),
    _RouteMarker(
      name: '🇧🇦 Bosnia',
      location: 'Sarajevo',
      coordinates: LatLng(43.8563, 18.4131),
      color: Color(0xFFEF4444),
      duration: '1 month',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      mapController: _mapController,
      options: MapOptions(
        initialCenter: const LatLng(40.0, 70.0), // Center over Central Asia
        initialZoom: 3.5,
        minZoom: 2,
        maxZoom: 8,
        interactionOptions: const InteractionOptions(
          flags: InteractiveFlag.all,
        ),
      ),
      children: [
        // OpenStreetMap Tile Layer (with labels)
      TileLayer(
  urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
  userAgentPackageName: 'com.example.ilham_portfolio',
  // Remove the commented line below
),
        
        // Route Polyline
     PolylineLayer(
  polylines: [
    Polyline(
      points: _routePoints,
      color: const Color(0xFF2563EB),
      strokeWidth: 4,
    ),
    // Add a second polyline for border effect if desired
    Polyline(
      points: _routePoints,
      color: Colors.white,
      strokeWidth: 2,
    ),
  ],
),
        
        // Custom Markers with Labels
        MarkerLayer(
          markers: _markers.map((marker) {
            return Marker(
              point: marker.coordinates,
              width: 120,
              height: 80,
              alignment: Alignment.center,
              child: GestureDetector(
                onTap: () {
                  _showMarkerInfo(context, marker);
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Marker Icon
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: marker.color,
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 3),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            spreadRadius: 2,
                            blurRadius: 4,
                          ),
                        ],
                      ),
                      child: Text(
                        marker.name.split(' ').first, // Flag emoji
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                    const SizedBox(height: 4),
                    // Location Label
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 4,
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          Text(
                            marker.location,
                            style: GoogleFonts.inter(
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xFF1F2937),
                            ),
                          ),
                          Text(
                            marker.duration,
                            style: GoogleFonts.inter(
                              fontSize: 8,
                              color: marker.color,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
        
        // Map Attribution (required for OpenStreetMap)
        RichAttributionWidget(
          attributions: [
            TextSourceAttribution(
              'OpenStreetMap contributors',
              onTap: () => launchUrl(Uri.parse('https://openstreetmap.org/copyright')),
            ),
          ],
        ),
      ],
    );
  }

  void _showMarkerInfo(BuildContext context, _RouteMarker marker) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: Text(
          marker.name,
          style: GoogleFonts.inter(fontWeight: FontWeight.bold),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Location: ${marker.location}'),
            Text('Stay: ${marker.duration}'),
            const SizedBox(height: 8),
            Container(
              height: 4,
              width: double.infinity,
              decoration: BoxDecoration(
                color: marker.color.withOpacity(0.2),
                borderRadius: BorderRadius.circular(2),
              ),
              child: FractionallySizedBox(
                alignment: Alignment.centerLeft,
                widthFactor: marker.duration == 'Starting Point' 
                    ? 1.0 
                    : double.parse(marker.duration.split(' ')[0]) / 4.0,
                child: Container(
                  decoration: BoxDecoration(
                    color: marker.color,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }
}

// Helper class for route markers
class _RouteMarker {
  final String name;
  final String location;
  final LatLng coordinates;
  final Color color;
  final String duration;

  const _RouteMarker({
    required this.name,
    required this.location,
    required this.coordinates,
    required this.color,
    required this.duration,
  });
}