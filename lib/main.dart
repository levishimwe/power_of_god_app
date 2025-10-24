import 'package:flutter/material.dart';

void main() {
  runApp(const PowerOfGodApp());
}

class PowerOfGodApp extends StatelessWidget {
  const PowerOfGodApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Power of God Through Words',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String searchQuery = '';
  
  // Bible verses mapped to situations/emotions
  final Map<String, List<Map<String, String>>> versesData = {
    'Fear': [
      {'reference': 'Isaiah 41:10', 'text': 'Fear not, for I am with you; be not dismayed, for I am your God; I will strengthen you, I will help you, I will uphold you with my righteous right hand.'},
      {'reference': '2 Timothy 1:7', 'text': 'For God gave us a spirit not of fear but of power and love and self-control.'},
      {'reference': 'Psalm 23:4', 'text': 'Even though I walk through the valley of the shadow of death, I will fear no evil, for you are with me; your rod and your staff, they comfort me.'},
    ],
    'Faith': [
      {'reference': 'Hebrews 11:1', 'text': 'Now faith is the assurance of things hoped for, the conviction of things not seen.'},
      {'reference': 'Mark 11:22-24', 'text': 'Have faith in God. Truly, I say to you, whoever says to this mountain, "Be taken up and thrown into the sea," and does not doubt in his heart, but believes that what he says will come to pass, it will be done for him.'},
      {'reference': 'Romans 10:17', 'text': 'So faith comes from hearing, and hearing through the word of Christ.'},
    ],
    'Wisdom': [
      {'reference': 'James 1:5', 'text': 'If any of you lacks wisdom, let him ask God, who gives generously to all without reproach, and it will be given him.'},
      {'reference': 'Proverbs 3:5-6', 'text': 'Trust in the Lord with all your heart, and do not lean on your own understanding. In all your ways acknowledge him, and he will make straight your paths.'},
      {'reference': 'Proverbs 2:6', 'text': 'For the Lord gives wisdom; from his mouth come knowledge and understanding.'},
    ],
    'Peace': [
      {'reference': 'John 14:27', 'text': 'Peace I leave with you; my peace I give to you. Not as the world gives do I give to you. Let not your hearts be troubled, neither let them be afraid.'},
      {'reference': 'Philippians 4:6-7', 'text': 'Do not be anxious about anything, but in everything by prayer and supplication with thanksgiving let your requests be made known to God. And the peace of God, which surpasses all understanding, will guard your hearts and your minds in Christ Jesus.'},
      {'reference': 'Isaiah 26:3', 'text': 'You keep him in perfect peace whose mind is stayed on you, because he trusts in you.'},
    ],
    'Troubles': [
      {'reference': 'John 16:33', 'text': 'I have said these things to you, that in me you may have peace. In the world you will have tribulation. But take heart; I have overcome the world.'},
      {'reference': 'Psalm 46:1', 'text': 'God is our refuge and strength, a very present help in trouble.'},
      {'reference': 'Romans 8:28', 'text': 'And we know that for those who love God all things work together for good, for those who are called according to his purpose.'},
    ],
    'Joy': [
      {'reference': 'Nehemiah 8:10', 'text': 'Do not be grieved, for the joy of the Lord is your strength.'},
      {'reference': 'Psalm 16:11', 'text': 'You make known to me the path of life; in your presence there is fullness of joy; at your right hand are pleasures forevermore.'},
      {'reference': 'Romans 15:13', 'text': 'May the God of hope fill you with all joy and peace in believing, so that by the power of the Holy Spirit you may abound in hope.'},
    ],
    'Strength': [
      {'reference': 'Philippians 4:13', 'text': 'I can do all things through him who strengthens me.'},
      {'reference': 'Isaiah 40:31', 'text': 'But they who wait for the Lord shall renew their strength; they shall mount up with wings like eagles; they shall run and not be weary; they shall walk and not faint.'},
      {'reference': 'Psalm 28:7', 'text': 'The Lord is my strength and my shield; in him my heart trusts, and I am helped; my heart exults, and with my song I give thanks to him.'},
    ],
    'Hope': [
      {'reference': 'Jeremiah 29:11', 'text': 'For I know the plans I have for you, declares the Lord, plans for welfare and not for evil, to give you a future and a hope.'},
      {'reference': 'Romans 5:3-5', 'text': 'We rejoice in our sufferings, knowing that suffering produces endurance, and endurance produces character, and character produces hope, and hope does not put us to shame.'},
      {'reference': 'Psalm 42:11', 'text': 'Why are you cast down, O my soul, and why are you in turmoil within me? Hope in God; for I shall again praise him, my salvation and my God.'},
    ],
  };

  List<String> get filteredSituations {
    if (searchQuery.isEmpty) {
      return versesData.keys.toList();
    }
    return versesData.keys
        .where((situation) => 
            situation.toLowerCase().contains(searchQuery.toLowerCase()))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Power of God Through Words'),
        backgroundColor: Colors.blue[700],
        foregroundColor: Colors.white,
        elevation: 2,
      ),
      body: Flex(
        direction: Axis.vertical,
        children: [
          // Search Section
          Container(
            padding: const EdgeInsets.all(16.0),
            color: Colors.blue[50],
            child: TextField(
              onChanged: (value) {
                setState(() {
                  searchQuery = value;
                });
              },
              decoration: InputDecoration(
                hintText: 'Search for a situation (e.g., fear, peace)...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
          ),
          
          // Situations Tags Section
          Expanded(
            flex: 1,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Choose Your Situation:',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    // WRAP WIDGET DEMONSTRATION
                    Wrap(
                      spacing: 12.0,  // Property 1: Horizontal spacing between chips
                      runSpacing: 12.0,  // Property 2: Vertical spacing between rows
                      alignment: WrapAlignment.center,  // Property 3: Alignment of children
                      children: filteredSituations.map((situation) {
                        return _buildSituationChip(context, situation);
                      }).toList(),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSituationChip(BuildContext context, String situation) {
    final colors = [
      Colors.blue,
      Colors.green,
      Colors.orange,
      Colors.purple,
      Colors.red,
      Colors.teal,
      Colors.indigo,
      Colors.pink,
    ];
    
    final color = colors[situation.hashCode % colors.length];
    
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => VersesScreen(
              situation: situation,
              verses: versesData[situation]!,
            ),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(25),
          boxShadow: [
            BoxShadow(
              color: color.withOpacity(0.3),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Text(
          situation,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}

class VersesScreen extends StatelessWidget {
  final String situation;
  final List<Map<String, String>> verses;

  const VersesScreen({
    Key? key,
    required this.situation,
    required this.verses,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$situation Verses'),
        backgroundColor: Colors.blue[700],
        foregroundColor: Colors.white,
      ),
      body: Flex(
        direction: Axis.vertical,  // Property 1: Direction of flex layout
        mainAxisAlignment: MainAxisAlignment.start,  // Property 2: Main axis alignment
        crossAxisAlignment: CrossAxisAlignment.stretch,  // Property 3: Cross axis alignment
        children: [
          Container(
            padding: const EdgeInsets.all(16.0),
            color: Colors.blue[50],
            child: Text(
              'Bible verses for $situation',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16.0),
              itemCount: verses.length,
              itemBuilder: (context, index) {
                return _buildVerseCard(context, verses[index]);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildVerseCard(BuildContext context, Map<String, String> verse) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16.0),
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => VerseDetailScreen(
                reference: verse['reference']!,
                text: verse['text']!,
              ),
            ),
          );
        },
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(Icons.book, color: Colors.blue[700], size: 20),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      verse['reference']!,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue[700],
                      ),
                    ),
                  ),
                  Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey[400]),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                verse['text']!,
                style: const TextStyle(
                  fontSize: 14,
                  height: 1.5,
                ),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class VerseDetailScreen extends StatelessWidget {
  final String reference;
  final String text;

  const VerseDetailScreen({
    Key? key,
    required this.reference,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(reference),
        backgroundColor: Colors.blue[700],
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.blue[50],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Icon(Icons.auto_stories, color: Colors.blue[700], size: 28),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      reference,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue[700],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            Text(
              text,
              style: const TextStyle(
                fontSize: 18,
                height: 1.8,
                letterSpacing: 0.3,
              ),
            ),
            const SizedBox(height: 32),
            Center(
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back),
                label: const Text('Back to Verses'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue[700],
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 12,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}