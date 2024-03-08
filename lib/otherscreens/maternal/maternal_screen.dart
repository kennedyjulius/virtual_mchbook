import 'package:flutter/material.dart';
import 'package:testsdk/common/utils/colors.dart';
import 'package:testsdk/common/utils/custom_containerutil.dart';
import 'package:testsdk/common/widgets/custom_textwidget.dart';
import 'package:testsdk/models/maternalprofile_model.dart';
import 'package:testsdk/services/maternalprofile_services.dart';

class MaternalScreen extends StatelessWidget {
  MaternalScreen({Key? key}) : super(key: key);

  final FirebaseService _firebaseService = FirebaseService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 2),
          child: Container(
            margin: const EdgeInsets.only(left: 2),
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: FutureBuilder<List<MaternalProfile>>(
              future: _firebaseService.getMaternalProfiles(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else {
                  List<MaternalProfile> profiles = snapshot.data ?? [];
                  return SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 50,
                          color: Colors.grey,
                          child: Center(
                            child: Text(
                              "Maternal Profile",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 3),
                        _buildInfoRow(
                            "Name of Facility :",
                            profiles,
                            (profile) => profile.facilityName ?? 'No Facility Name'),
                        _buildInfoRow(
                            "KMHFL code :",
                            profiles,
                            (profile) => profile.kMHFLcode?.toString() ?? 'No Code'),
                        _buildInfoRow(
                            "ANC :",
                            profiles,
                            (profile) => profile.anc ?? 'No ANC'),
                        _buildInfoRow(
                            "PNC No :",
                            profiles,
                            (profile) => profile.pncNo?.toString() ?? 'No PNC No'),
                        _buildInfoRow(
                            "Name of Client :",
                            profiles,
                            (profile) => profile.nameofclient ?? 'No Name'),
                            _buildInfoSeveralRows("Age :", profiles),
_buildInfoSeveralRows("Gravida :", profiles),
_buildInfoSeveralRows("Parity :", profiles),
_buildInfoSeveralRows("Height(cm) :", profiles),
_buildInfoSeveralRows("Weight(kg) :", profiles),

                        _buildInfoRow(
                            "Marital Status :", profiles, (profile) => profile.maritalStatus ?? 'N/A'),
                        _buildCountyRow(profiles),
                        _buildTownRow(profiles),
                        _buildAddressRow(profiles),
                        _buildNextOfKinRow(profiles),
                        _buildInfoRow(
                            "Nextkin contacts :", profiles, (profile) => profile.nextOfKinContacts?.toString() ?? 'N/A'),
                        Container(
                          height: 50,
                          color: Colors.grey,
                          child: Center(
                            child: Text(
                              "Medical & Surgical History",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        // Medical & Surgical History Widgets
                      ],
                    ),
                  );
                }
              },
            ),
          ),
        ),
      ),
    );
  }

 Widget _buildInfoRow(String label, List<MaternalProfile> profiles,
      String Function(MaternalProfile) valueExtractor) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CustomTextWidget(
            text: label,
            size: 14,
            color: ColorsContants.textColormain,
            fontWeight: FontWeight.bold,
          ),
          SizedBox(width: 4),
          Expanded(
            child: CustomContainer(
              height: 30,
              width: 120,
              child: Text(valueExtractor(profiles.isNotEmpty ? profiles.first : MaternalProfile()) ?? 'N/A'),
            ),
          ),
        ],
      ),
    );
  }


  Widget _buildInfoSeveralRows(String label, List<MaternalProfile> profiles) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 8),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CustomTextWidget(
          text: label,
          size: 14,
          color: ColorsContants.textColormain,
          fontWeight: FontWeight.bold,
        ),
        SizedBox(width: 4),
        Expanded(
          child: CustomContainer(
            height: 30,
            width: 120,
            child: Text(_getValueForLabel(label, profiles) ?? 'N/A'),
          ),
        ),
      ],
    ),
  );
}

String? _getValueForLabel(String label, List<MaternalProfile> profiles) {
  switch (label) {
    case "Age :":
      return profiles.isNotEmpty ? profiles.first.age.toString() : 'N/A';
    case "Gravida :":
      return profiles.isNotEmpty ? profiles.first.gravida.toString() : 'N/A';
    case "Parity :":
      return profiles.isNotEmpty ? profiles.first.parity.toString() : 'N/A';
    case "Height(cm) :":
      return profiles.isNotEmpty ? profiles.first.height.toString() : 'N/A';
    case "Weight(kg) :":
      return profiles.isNotEmpty ? profiles.first.weight.toString() : 'N/A';
    default:
      return 'N/A';
  }
}

  Widget _buildCountyRow(List<MaternalProfile> profiles) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CustomTextWidget(
            text: "County :",
            size: 14,
            color: ColorsContants.textColormain,
            fontWeight: FontWeight.bold,
          ),
          SizedBox(width: 4),
          CustomContainer(
            height: 30,
            width: 70,
            child: Text(profiles.isNotEmpty ? profiles.first.county ?? 'N/A' : 'N/A'),
          ),
          SizedBox(width: 4),
          CustomTextWidget(
            text: "SubCounty :",
            size: 14,
            color: ColorsContants.textColormain,
            fontWeight: FontWeight.bold,
          ),
          SizedBox(width: 4),
          CustomContainer(
            height: 30,
            width: 50,
            child: Text(profiles.isNotEmpty ? profiles.first.subCounty ?? 'N/A' : 'N/A'),
          ),
          SizedBox(width: 1),
          Expanded(
            child: CustomTextWidget(
              text: "Ward",
              size: 14,
              color: ColorsContants.textColormain,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(width: 1),
          CustomContainer(
            height: 30,
            width: 70,
            child: Text(profiles.isNotEmpty ? profiles.first.ward ?? 'N/A' : 'N/A'),
          ),
        ],
      ),
    );
  }

  Widget _buildTownRow(List<MaternalProfile> profiles) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomTextWidget(
            text: "Town/Market :",
            size: 14,
            color: ColorsContants.textColormain,
            fontWeight: FontWeight.bold,
          ),
          SizedBox(width: 4),
          CustomContainer(
            height: 30,
            width: 100,
            child: Text(profiles.isNotEmpty ? profiles.first.town ?? 'N/A' : 'N/A'),
          ),
          SizedBox(width: 4),
          CustomTextWidget(
            text: "Estate :",
            size: 14,
            color: ColorsContants.textColormain,
            fontWeight: FontWeight.bold,
          ),
          SizedBox(width: 4),
          Expanded(
            child: CustomContainer(
              height: 30,
              width: 100,
              child: Text(profiles.isNotEmpty ? profiles.first.estate ?? 'N/A' : 'N/A'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAddressRow(List<MaternalProfile> profiles) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CustomTextWidget(
            text: "Physical Address :",
            size: 14,
            color: ColorsContants.textColormain,
            fontWeight: FontWeight.bold,
          ),
          SizedBox(width: 4),
          Expanded(
            child: CustomContainer(
              height: 30,
              width: 250,
              child: Text(profiles.isNotEmpty ? profiles.first.physicalAddress ?? 'N/A' : 'N/A'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNextOfKinRow(List<MaternalProfile> profiles) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CustomTextWidget(
            text: "Next of Kin :",
            size: 14,
            color: ColorsContants.textColormain,
            fontWeight: FontWeight.bold,
          ),
          SizedBox(width: 4),
          CustomContainer(
            height: 30,
            width: 120,
            child: Text(profiles.isNotEmpty ? profiles.first.nextOfKin ?? 'N/A' : 'N/A'),
          ),
          SizedBox(width: 4),
          CustomTextWidget(
            text: "Relationship :",
            size: 14,
            color: ColorsContants.textColormain,
            fontWeight: FontWeight.bold,
          ),
          SizedBox(width: 4),
          Expanded(
            child: CustomContainer(
              height: 30,
              width: 120,
              child: Text(profiles.isNotEmpty ? profiles.first.relationship ?? 'N/A' : 'N/A'),
            ),
          ),
        ],
      ),
    );
  }
}
