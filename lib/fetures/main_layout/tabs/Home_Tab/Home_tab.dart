import 'package:evently_app/Models/Event_Model.dart';
import 'package:evently_app/Models/User_Model.dart';
import 'package:evently_app/core/Widget/Custom_tab_bar.dart';
import 'package:evently_app/fetures/main_layout/tabs/Home_Tab/Event_Item.dart';
import 'package:evently_app/Models/Catogry_model.dart';
import 'package:evently_app/core/Colorsmanger/Colorsmanger.dart';
import 'package:evently_app/Firebase_Servicess/FairebaseServicess.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:evently_app/l10n/app_localizations.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  int selectedIndex = 0;
  List<EventModel> events = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    getEvents();
  }

  void getEvents() async {
    try {
      events = await Fairebaeservices.getEvents(context);
      print("✅ Loaded ${events.length} events");
    } catch (e) {
      print("❌ Error getting events: $e");
    } finally {
      setState(() => isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        // 🔹 Header Section
        Container(
          width: double.infinity,
          height: 200,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(20.r)),
            color: Colorsmanger.Blue,
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.welcome_message,
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      const SizedBox(height: 5),
                      Text(
                        UserModel.currentUser?.name ?? "User",
                        style: GoogleFonts.inter(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: Row(
                          children: [
                            const Icon(Icons.location_on,
                                color: Colorsmanger.Whiteblue),
                            const SizedBox(width: 4),
                            Text(
                              "Cairo, Egypt ✨",
                              style: GoogleFonts.inter(
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                color: Colorsmanger.Whiteblue,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {},
                    icon:
                    const Icon(Icons.sunny, color: Colorsmanger.Whiteblue),
                  ),
                  const SizedBox(width: 5),
                  InkWell(
                    onTap: () {},
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Text("En",
                            style: Theme.of(context).textTheme.bodySmall),
                      ),
                    ),
                  ),
                ],
              ),
              CustomTabBar(
                bgselecteditem: Colorsmanger.Whiteblue,
                fgselecteditem: Colorsmanger.Blue,
                unbgselecteditem: Colors.transparent,
                unfgselecteditem: Colorsmanger.Whiteblue,
                catogries: CatogryModel.getCatogries(context),
              ),
            ],
          ),
        ),

        // 🔹 Events Section
        const SizedBox(height: 20),
        if (isLoading)
          const Center(
            child: Padding(
              padding: EdgeInsets.all(40),
              child: CircularProgressIndicator(),
            ),
          )
        else if (events.isEmpty)
          const Center(
            child: Padding(
              padding: EdgeInsets.all(40),
              child: Text("No events found 😔"),
            ),
          )
        else
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: List.generate(events.length, (index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: EventItem(event: events[index]),
                );
              }),
            ),
          ),
      ],
    );
  }
}
