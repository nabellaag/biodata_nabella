import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        primaryColor: Colors.teal,
        scaffoldBackgroundColor: Colors.black,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.teal,
        ),
        textTheme: const TextTheme(
          bodyMedium: TextStyle(color: Colors.white),
        ),
      ),
      home: const ProfileScreen(),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Profile"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Hello, I'm Bella 👋",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16.0),
            Center(
              child: Container(
                width: 400,
                height: 200,
                decoration: const BoxDecoration(
                  shape: BoxShape.rectangle,
                  image: DecorationImage(
                    image: AssetImage('assets/bg_data.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: const Align(
                  alignment: Alignment.center,
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('assets/na.jpeg'),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            const Text(
              "Nabella Ayu Giwanti",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const Text(
              "IT Enthusiast",
              style: TextStyle(fontSize: 18),
            ),
            const Text(
              "Undergraduate Informatics, Amikom Yogyakarta University",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16.0),
            const Text(
              "About",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const Text(
              "Enthusiast in Data Science, Mobile Development, and UI/UX design. Passionate about learning and implementing new technologies.",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16.0),
            const Text(
              "Experience",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const JobExperience(
              organization: "Forum Asisten",
              location: "Sleman, Yogyakarta, Indonesia - On-site",
              jobs: [
                JobDetail(
                  position: "Assistant for Big Data & Predictive Analytic",
                  duration: "Feb 2024 - Present",
                ),
                JobDetail(
                  position: "Assistant for Database Programming",
                  duration: "Feb 2024 - Present",
                ),
                JobDetail(
                  position: "Assistant for Data Visualization",
                  duration: "Sep 2023 - Jan 2024",
                ),
              ],
              image: 'assets/FA.png',
            ),
            const VolunteerExperience(
              organization: "AMIKOM Computer Club",
              location: "Sleman, Yogyakarta, Indonesia",
              position: "PDD SEMNAS 2022",
              duration: "Juni 2022 - Aug 2023",
              image: 'assets/amcc.png',
            ),
            const SizedBox(height: 16.0),
            const Text(
              "Skills",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SkillList(
              skills: [
                "Leadership",
                "Analytic",
                "Critical Thinking",
                "Python",
                "SQL",
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ExperienceItem extends StatelessWidget {
  final String position;
  final String organization;
  final String duration;
  final String location;

  const ExperienceItem({
    super.key,
    required this.position,
    required this.organization,
    required this.duration,
    required this.location,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                position,
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                organization,
                style: const TextStyle(fontSize: 16),
              ),
              Text(
                duration,
                style: const TextStyle(fontSize: 14, color: Colors.grey),
              ),
              Text(
                location,
                style: const TextStyle(fontSize: 14, color: Colors.grey),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class JobExperience extends StatelessWidget {
  final String organization;
  final String location;
  final List<JobDetail> jobs;
  final String image;

  const JobExperience({
    super.key,
    required this.organization,
    required this.location,
    required this.jobs,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            image,
            width: 60,
            height: 70,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  organization,
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  location,
                  style: const TextStyle(fontSize: 14, color: Colors.grey),
                ),
                const SizedBox(height: 5),
                for (JobDetail job in jobs)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        job.position,
                        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        job.duration,
                        style: const TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                      const SizedBox(height: 5),
                    ],
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class JobDetail {
  final String position;
  final String duration;

  const JobDetail({
    required this.position,
    required this.duration,
  });
}

class SkillList extends StatelessWidget {
  final List<String> skills;

  const SkillList({
    super.key,
    required this.skills,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: skills.map((skill) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0),
        child: Text(
          skill,
          style: const TextStyle(fontSize: 16),
        ),
      )).toList(),
    );
  }
}

class VolunteerExperience extends StatelessWidget {
  final String organization;
  final String location;
  final String position;
  final String duration;
  final String image;

  const VolunteerExperience({
    super.key,
    required this.organization,
    required this.location,
    required this.position,
    required this.duration,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            image,
            width: 60,
            height: 70,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  organization,
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  location,
                  style: const TextStyle(fontSize: 14, color: Colors.grey),
                ),
                const SizedBox(height: 5),
                Text(
                  position,
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(
                  duration,
                  style: const TextStyle(fontSize: 14, color: Colors.grey),
                ),
                const SizedBox(height: 5),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class BackgroundProfile extends StatelessWidget {
  final double width;
  final double height;
  final BoxDecoration decoration;
  final Widget child;

  const BackgroundProfile({
    super.key,
    required this.width,
    required this.height,
    required this.decoration,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: decoration,
      child: child,
    );
  }
}