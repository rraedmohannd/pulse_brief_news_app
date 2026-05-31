import '../models/news_article_model.dart';
import '../models/news_category_model.dart';
import '../models/reading_tag_model.dart';

class MockNewsData {
  const MockNewsData._();

  static const List<NewsCategoryModel> categories = [
    NewsCategoryModel(
      id: 'world',
      name: 'World',
      iconAssetPath: 'assets/icons/world.svg',
      articleCount: 2,
    ),
    NewsCategoryModel(
      id: 'technology',
      name: 'Technology',
      iconAssetPath: 'assets/icons/technology.svg',
      articleCount: 2,
    ),
    NewsCategoryModel(
      id: 'business',
      name: 'Business',
      iconAssetPath: 'assets/icons/business.svg',
      articleCount: 3,
    ),
    NewsCategoryModel(
      id: 'health',
      name: 'Health',
      iconAssetPath: 'assets/icons/health.svg',
      articleCount: 2,
    ),
    NewsCategoryModel(
      id: 'sports',
      name: 'Sports',
      iconAssetPath: 'assets/icons/sports.svg',
      articleCount: 2,
    ),
    NewsCategoryModel(
      id: 'science',
      name: 'Science',
      iconAssetPath: 'assets/icons/science.svg',
      articleCount: 2,
    ),
    NewsCategoryModel(
      id: 'lifestyle',
      name: 'Lifestyle',
      iconAssetPath: 'assets/icons/lifestyle.svg',
      articleCount: 2,
    ),
  ];

  static const List<ReadingTagModel> readingTags = [
    ReadingTagModel(
      id: 'breaking',
      name: 'Breaking',
      description: 'Fresh updates that deserve immediate attention.',
    ),
    ReadingTagModel(
      id: 'trending',
      name: 'Trending',
      description: 'Stories gaining strong reader interest today.',
    ),
    ReadingTagModel(
      id: 'quick-read',
      name: 'Quick Read',
      description: 'Concise stories for a fast catch-up.',
    ),
    ReadingTagModel(
      id: 'deep-dive',
      name: 'Deep Dive',
      description: 'Longer context for thoughtful reading.',
    ),
    ReadingTagModel(
      id: 'important',
      name: 'Important',
      description: 'Useful developments with practical impact.',
    ),
  ];

  static final List<NewsArticleModel> articles = [
    NewsArticleModel(
      id: 'article-001',
      title: 'Global Cities Expand Smart Infrastructure',
      summary:
          'Urban planners are coordinating sensors, cleaner transit, and public dashboards to make city services more responsive.',
      content:
          'City innovation teams in several major regions are introducing connected street lighting, adaptive traffic signals, and public service dashboards designed to reduce everyday delays. The newest programs focus on practical upgrades that residents can notice quickly, including shorter bus waits, safer crossings, and faster maintenance reports.\n\nOfficials say the most successful pilots are the ones that pair technology with clear community rules. Privacy reviews, open data standards, and neighborhood feedback sessions are becoming part of the planning process so that smart infrastructure feels useful, transparent, and accountable.',
      category: 'World',
      source: 'Urban Ledger',
      author: 'Maya Haddad',
      publishedAt: DateTime(2026, 5, 31, 8, 15),
      readingTime: '4 min read',
      imageUrl:
          'https://images.unsplash.com/photo-1449824913935-59a10b8d2000?auto=format&fit=crop&w=1200&q=80',
      sourceUrl: 'https://example.com/pulsebrief/smart-infrastructure',
      readingTag: 'Breaking',
      isBreaking: true,
    ),
    NewsArticleModel(
      id: 'article-002',
      title: 'New AI Tools Improve Small Business Productivity',
      summary:
          'Small teams are using lightweight assistants for scheduling, inventory summaries, and customer response drafts.',
      content:
          'A new wave of business software is giving small companies access to automation once reserved for larger organizations. Owners are using AI-powered dashboards to summarize orders, draft customer messages, and organize weekly priorities without adding extra administrative staff.\n\nThe strongest adoption appears in businesses that treat automation as a support layer rather than a replacement for human judgment. Consultants recommend starting with repetitive tasks, reviewing every customer-facing message, and measuring time saved before expanding into more complex workflows.',
      category: 'Technology',
      source: 'Signal Desk',
      author: 'Omar Saadeh',
      publishedAt: DateTime(2026, 5, 30, 16, 40),
      readingTime: '5 min read',
      imageUrl:
          'https://images.unsplash.com/photo-1497366754035-f200968a6e72?auto=format&fit=crop&w=1200&q=80',
      sourceUrl: 'https://example.com/pulsebrief/ai-small-business',
      readingTag: 'Trending',
      isBreaking: false,
    ),
    NewsArticleModel(
      id: 'article-003',
      title: 'Health Experts Highlight Better Sleep Habits',
      summary:
          'Clinicians are encouraging practical evening routines as more people report fatigue during busy work weeks.',
      content:
          'Health specialists are renewing attention on sleep quality after surveys found that many adults feel rested only a few mornings each week. Their guidance emphasizes consistent bedtimes, reduced late-night screen exposure, and cooler bedrooms as simple starting points.\n\nExperts also note that sleep routines are easier to sustain when they match real schedules. Instead of dramatic changes, they recommend small adjustments over several weeks, such as moving caffeine earlier in the day and creating a short wind-down routine that can be repeated even during travel.',
      category: 'Health',
      source: 'Wellness Review',
      author: 'Leen Mansour',
      publishedAt: DateTime(2026, 5, 29, 10, 5),
      readingTime: '3 min read',
      imageUrl:
          'https://images.unsplash.com/photo-1511295742362-92c96b1cf484?auto=format&fit=crop&w=1200&q=80',
      sourceUrl: 'https://example.com/pulsebrief/better-sleep-habits',
      readingTag: 'Quick Read',
      isBreaking: false,
    ),
    NewsArticleModel(
      id: 'article-004',
      title: 'Renewable Energy Projects Accelerate Worldwide',
      summary:
          'Solar, wind, and storage investments are moving faster as cities and companies seek stable long-term power costs.',
      content:
          'Renewable energy developers are reporting shorter project timelines as new financing models and improved grid planning help projects move from proposal to construction. Solar arrays, offshore wind studies, and battery storage systems are appearing together more often as planners look for steady power throughout the day.\n\nAnalysts say the next challenge is coordination. Communities want cleaner energy, but they also want responsible land use, transparent pricing, and stronger local job pathways. Projects that answer those concerns early are moving through approval processes with fewer delays.',
      category: 'World',
      source: 'Global Current',
      author: 'Nadia Salim',
      publishedAt: DateTime(2026, 5, 28, 13, 25),
      readingTime: '6 min read',
      imageUrl:
          'https://images.unsplash.com/photo-1509391366360-2e959784a276?auto=format&fit=crop&w=1200&q=80',
      sourceUrl: 'https://example.com/pulsebrief/renewable-projects',
      readingTag: 'Important',
      isBreaking: false,
    ),
    NewsArticleModel(
      id: 'article-005',
      title: 'Football Clubs Invest in Youth Academies',
      summary:
          'Clubs are expanding coaching, education, and wellness programs to build stronger long-term player pathways.',
      content:
          'Several football clubs are increasing academy budgets with a broader view of player development. New programs combine technical training with nutrition support, mental performance coaching, and academic mentoring so young athletes can grow with a healthier structure around them.\n\nCoaches say the shift is changing how talent is evaluated. Instead of focusing only on early physical advantages, academies are tracking decision-making, teamwork, resilience, and consistency. The result is a more patient development model that may benefit both clubs and players.',
      category: 'Sports',
      source: 'Matchline Weekly',
      author: 'Rami Khalil',
      publishedAt: DateTime(2026, 5, 27, 18, 0),
      readingTime: '4 min read',
      imageUrl:
          'https://images.unsplash.com/photo-1522778119026-d647f0596c20?auto=format&fit=crop&w=1200&q=80',
      sourceUrl: 'https://example.com/pulsebrief/youth-academies',
      readingTag: 'Trending',
      isBreaking: false,
    ),
    NewsArticleModel(
      id: 'article-006',
      title: 'Scientists Discover New Ocean Data Patterns',
      summary:
          'Researchers are using improved sensor networks to understand subtle changes in ocean temperature and movement.',
      content:
          'Marine research teams have identified new patterns in ocean sensor readings that could improve seasonal forecasting and coastal planning. The findings come from a wider network of floating monitors that measure temperature, salinity, and current movement at different depths.\n\nScientists caution that the patterns need continued observation before they can support major predictions. Still, the richer data is already helping researchers refine models and share clearer information with fisheries, ports, and environmental planners.',
      category: 'Science',
      source: 'Ocean Field Notes',
      author: 'Tala Nasser',
      publishedAt: DateTime(2026, 5, 26, 9, 30),
      readingTime: '5 min read',
      imageUrl:
          'https://images.unsplash.com/photo-1507525428034-b723cf961d3e?auto=format&fit=crop&w=1200&q=80',
      sourceUrl: 'https://example.com/pulsebrief/ocean-data-patterns',
      readingTag: 'Deep Dive',
      isBreaking: false,
    ),
    NewsArticleModel(
      id: 'article-007',
      title: 'Digital Payments Continue to Grow',
      summary:
          'Merchants are adopting faster checkout options as customers expect secure, flexible payment experiences.',
      content:
          'Digital payment adoption continues to rise across retail, delivery, and service businesses. New checkout tools allow customers to pay through mobile wallets, instant transfers, and secure links, reducing friction for both in-person and online purchases.\n\nFinancial analysts say trust remains the key factor. Businesses that explain fees clearly, protect transaction data, and offer reliable support are seeing stronger repeat usage. Smaller merchants are also benefiting from simpler accounting dashboards connected to payment systems.',
      category: 'Business',
      source: 'Market Harbor',
      author: 'Sami Darwish',
      publishedAt: DateTime(2026, 5, 25, 14, 50),
      readingTime: '3 min read',
      imageUrl:
          'https://images.unsplash.com/photo-1563013544-824ae1b704d3?auto=format&fit=crop&w=1200&q=80',
      sourceUrl: 'https://example.com/pulsebrief/digital-payments-grow',
      readingTag: 'Quick Read',
      isBreaking: false,
    ),
    NewsArticleModel(
      id: 'article-008',
      title: 'New Smartphone Security Features Released',
      summary:
          'Device makers are focusing on simpler privacy controls, passkey support, and clearer app permission prompts.',
      content:
          'Smartphone platforms are rolling out security updates that make privacy settings easier to understand. The latest features include clearer permission timelines, expanded passkey support, and alerts when apps request sensitive access in the background.\n\nSecurity specialists welcome the simpler language because many users ignore protections that feel too technical. They recommend updating devices promptly, removing unused apps, and reviewing account recovery options before a phone is lost or replaced.',
      category: 'Technology',
      source: 'Device Journal',
      author: 'Hiba Qasem',
      publishedAt: DateTime(2026, 5, 24, 11, 45),
      readingTime: '4 min read',
      imageUrl:
          'https://images.unsplash.com/photo-1516321318423-f06f85e504b3?auto=format&fit=crop&w=1200&q=80',
      sourceUrl: 'https://example.com/pulsebrief/smartphone-security',
      readingTag: 'Important',
      isBreaking: false,
    ),
    NewsArticleModel(
      id: 'article-009',
      title: 'Climate Innovation Gains Investor Attention',
      summary:
          'Startups working on water efficiency, building materials, and clean logistics are attracting new funding rounds.',
      content:
          'Investors are showing fresh interest in climate-focused companies that solve operational problems for cities and industries. The strongest funding rounds are going to teams that can prove measurable savings, such as lower energy use, reduced waste, or improved water management.\n\nFounders say buyers are asking for practical deployments rather than experimental promises. As a result, many startups are building pilots with hospitals, campuses, factories, and logistics firms where outcomes can be tested in everyday conditions.',
      category: 'Business',
      source: 'Capital Window',
      author: 'Dana Faris',
      publishedAt: DateTime(2026, 5, 23, 12, 20),
      readingTime: '6 min read',
      imageUrl:
          'https://images.unsplash.com/photo-1473341304170-971dccb5ac1e?auto=format&fit=crop&w=1200&q=80',
      sourceUrl: 'https://example.com/pulsebrief/climate-innovation-investors',
      readingTag: 'Deep Dive',
      isBreaking: false,
    ),
    NewsArticleModel(
      id: 'article-010',
      title: 'Remote Work Tools Become More Intelligent',
      summary:
          'Collaboration platforms are adding summaries, meeting follow-ups, and focus tools for distributed teams.',
      content:
          'Remote work platforms are becoming more context-aware as teams look for better ways to coordinate across time zones. New tools summarize long discussions, organize action items, and suggest focus blocks based on calendar patterns.\n\nManagers say the biggest benefit is reducing the burden of staying informed. However, teams still need clear norms around response time, meeting purpose, and documentation quality. Intelligent tools work best when paired with thoughtful communication habits.',
      category: 'Lifestyle',
      source: 'Modern Work Review',
      author: 'Yara Ilyas',
      publishedAt: DateTime(2026, 5, 22, 15, 10),
      readingTime: '5 min read',
      imageUrl:
          'https://images.unsplash.com/photo-1521737604893-d14cc237f11d?auto=format&fit=crop&w=1200&q=80',
      sourceUrl: 'https://example.com/pulsebrief/remote-work-tools',
      readingTag: 'Trending',
      isBreaking: false,
    ),
    NewsArticleModel(
      id: 'article-011',
      title: 'Hospitals Adopt Faster Patient Tracking Systems',
      summary:
          'Care teams are testing digital boards that reduce waiting times and improve coordination across departments.',
      content:
          'Hospitals are adopting patient tracking systems that give nurses, physicians, and administrators a shared view of care progress. The systems help teams see which rooms are ready, which tests are pending, and where delays need attention.\n\nHealthcare leaders say the goal is not only speed but also clarity. When status updates are visible across departments, patients receive more consistent communication and staff can prioritize urgent needs with less manual follow-up.',
      category: 'Health',
      source: 'Care Systems Today',
      author: 'Karim Awad',
      publishedAt: DateTime(2026, 5, 21, 9, 55),
      readingTime: '4 min read',
      imageUrl:
          'https://images.unsplash.com/photo-1505751172876-fa1923c5c528?auto=format&fit=crop&w=1200&q=80',
      sourceUrl: 'https://example.com/pulsebrief/patient-tracking',
      readingTag: 'Important',
      isBreaking: false,
    ),
    NewsArticleModel(
      id: 'article-012',
      title: 'Space Research Mission Sends New Images',
      summary:
          'A research spacecraft has delivered high-resolution visuals that help teams study surface texture and light patterns.',
      content:
          'A space research mission has sent a new set of high-resolution images to mission control, giving scientists a closer view of surface features and changing light conditions. The images will support mapping work and help engineers refine future navigation plans.\n\nResearchers are especially interested in comparing the latest visuals with older observations. Small differences in shadow, dust, and texture can reveal how an environment changes over time, even when those changes appear subtle to the casual viewer.',
      category: 'Science',
      source: 'Orbit Brief',
      author: 'Rana Jaber',
      publishedAt: DateTime(2026, 5, 20, 19, 35),
      readingTime: '4 min read',
      imageUrl:
          'https://images.unsplash.com/photo-1446776811953-b23d57bd21aa?auto=format&fit=crop&w=1200&q=80',
      sourceUrl: 'https://example.com/pulsebrief/space-mission-images',
      readingTag: 'Breaking',
      isBreaking: true,
    ),
    NewsArticleModel(
      id: 'article-013',
      title: 'Local Entrepreneurs Launch Delivery Platforms',
      summary:
          'New delivery services are focusing on neighborhood merchants, reliable routing, and transparent service fees.',
      content:
          'Entrepreneurs in growing city districts are launching delivery platforms built around local merchants. Instead of competing only on speed, the services are highlighting predictable pickup windows, fair merchant terms, and better communication with customers.\n\nBusiness owners say the local approach can help independent shops reach more buyers without losing their identity. The platforms are also experimenting with shared courier hubs to reduce travel distance and make daily operations more efficient.',
      category: 'Business',
      source: 'City Makers',
      author: 'Zein Barakat',
      publishedAt: DateTime(2026, 5, 19, 13, 5),
      readingTime: '3 min read',
      imageUrl:
          'https://images.unsplash.com/photo-1526367790999-0150786686a2?auto=format&fit=crop&w=1200&q=80',
      sourceUrl: 'https://example.com/pulsebrief/local-delivery-platforms',
      readingTag: 'Quick Read',
      isBreaking: false,
    ),
    NewsArticleModel(
      id: 'article-014',
      title: 'Lifestyle Brands Move Toward Sustainable Design',
      summary:
          'Design teams are choosing recycled materials, longer product lifecycles, and calmer packaging systems.',
      content:
          'Lifestyle brands are putting sustainability into product design rather than treating it as a marketing layer. Teams are selecting recycled fabrics, refillable containers, and modular components that make repair or reuse easier.\n\nDesigners say customers are responding to products that feel both responsible and refined. The next phase will depend on clear labeling, durable quality, and supply chains that can support sustainable choices at a larger scale.',
      category: 'Lifestyle',
      source: 'Design Current',
      author: 'Nour Hamdan',
      publishedAt: DateTime(2026, 5, 18, 17, 25),
      readingTime: '5 min read',
      imageUrl:
          'https://images.unsplash.com/photo-1515886657613-9f3515b0c78f?auto=format&fit=crop&w=1200&q=80',
      sourceUrl: 'https://example.com/pulsebrief/sustainable-design',
      readingTag: 'Deep Dive',
      isBreaking: false,
    ),
    NewsArticleModel(
      id: 'article-015',
      title: 'Marathon Events Add Smarter Recovery Support',
      summary:
          'Race organizers are improving athlete support with hydration analytics, recovery zones, and safer route planning.',
      content:
          'Major marathon events are adding smarter support systems for recreational and elite runners. Organizers are combining route sensors, medical station dashboards, and clearer hydration planning to help teams respond more quickly throughout race day.\n\nSports scientists say the improvements matter because recovery begins before the finish line. Better pacing information, shaded rest zones, and post-race mobility support can reduce fatigue and make large community events safer for a wider range of participants.',
      category: 'Sports',
      source: 'Endurance Report',
      author: 'Fares Nabulsi',
      publishedAt: DateTime(2026, 5, 17, 8, 45),
      readingTime: '4 min read',
      imageUrl:
          'https://images.unsplash.com/photo-1552674605-db6ffd4facb5?auto=format&fit=crop&w=1200&q=80',
      sourceUrl: 'https://example.com/pulsebrief/marathon-recovery-support',
      readingTag: 'Important',
      isBreaking: false,
    ),
  ];
}
