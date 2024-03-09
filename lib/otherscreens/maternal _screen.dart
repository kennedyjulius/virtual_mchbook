
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:testsdk/common/utils/custom_containerutil.dart';
import 'package:testsdk/otherscreens/antenatal_profile.dart';

class MaternalScreen extends StatefulWidget {
  const MaternalScreen({super.key});

  @override
  State<MaternalScreen> createState() => _MaternalScreenState();
}

class _MaternalScreenState extends State<MaternalScreen> {
  

  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      //AppBar
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Colors.purple,
        title:const  Text('Maternal profile ',style: TextStyle(color: Colors.white,fontSize: 30,fontStyle: FontStyle.italic),),
      ),
      backgroundColor: Colors.white,
      body:  Column(
        children: [
          
          Expanded(
                child: FutureBuilder(
                  future: FirebaseFirestore.instance.collection('MaternalProfile').get(),
                  builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (snapshot.hasError) {
                      return Center(
                        child: Text('Error: ${snapshot.error}'),
                      );
                    } else {
                      return ListView.builder(
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (context, index) {
                          var document = snapshot.data!.docs[index];
                          var data = document.data() as Map<String, dynamic>;
                          return Container(
                            
                            height: 840,
                            width: double.maxFinite,
                            child: Column(
                              children: [
                                Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 5, vertical: 15),
                                  height: 430,
                                  width: double.maxFinite,
                                  decoration:
                                      BoxDecoration(border: Border.all(width: 1)),
                                  child: Column(
                                    children: [
                                      Container(
                                        height: 40,
                                        color: Colors.grey,
                                        child: const Center(
                                          child: Text(
                                            'MATERNAL PROFILE ',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18),
                                          ),
                                        ),
                                      ),
          
                                      //container containing the Physical examination data
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10, vertical: 10),
                                        child: Column(
                                          children: [
                                            Row(
                                              children: [
                                                const Text(
                                                  'Name of facility:',
                                                  style: TextStyle(
                                                      fontWeight: FontWeight.w600),
                                                ),
                                                const SizedBox(
                                                  width: 5,
                                                ),
                                                Expanded(
                                                  child: CustomContainer(
                                                      height: 20,
                                                      width: double.maxFinite,
                                                      child: Text(data[
                                                              'facilityName'] ??
                                                          '')),
                                                )
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Row(
                                              children: [
                                                const Text('KMHFL Code:',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w600)),
                                                const SizedBox(
                                                  width: 5,
                                                ),
                                                Expanded(
                                                  child: CustomContainer(
                                                      height: 20,
                                                      width: double.maxFinite,
                                                      child:
                                                          Text(data['KMHFLcode'] ?? '')),
                                                ),
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                const Text('ANC:',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w600)),
                                                const SizedBox(
                                                  width: 5,
                                                ),
                                                Expanded(
                                                  child: CustomContainer(
                                                      height: 20,
                                                      width: double.maxFinite,
                                                      child: Text(
                                                          data['pulse rate'] ??
                                                              '')),
                                                )
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                             Row(
                                              children: [
                                                const Text(
                                                  'Name of Client:',
                                                  style: TextStyle(
                                                      fontWeight: FontWeight.w600),
                                                ),
                                                const SizedBox(
                                                  width: 5,
                                                ),
                                                Expanded(
                                                  child: CustomContainer(
                                                      height: 20,
                                                      width: double.maxFinite,
                                                      child: Text(data[
                                                              'general examination'] ??
                                                          '')),
                                                )
                                              ],
                                            ),
                                            const SizedBox(height: 10,),
                                            Row(
                                              children: [
                                                const Text('PNC No:',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w600)),
                                                const SizedBox(
                                                  width: 5,
                                                ),
                                                Expanded(
                                                  child: CustomContainer(
                                                      height: 20,
                                                      width: double.maxFinite,
                                                      child:
                                                          Text(data['cvs'] ?? '')),
                                                ),
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                const Text('Age:',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w600)),
                                                const SizedBox(
                                                  width: 5,
                                                ),
                                                Expanded(
                                                  child: CustomContainer(
                                                      height: 20,
                                                      width: double.maxFinite,
                                                      child:
                                                          Text(data['resp'] ?? '')),
                                                )
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Row(
                                              children: [
                                                const Text('Gravida:',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w600)),
                                                const SizedBox(
                                                  width: 5,
                                                ),
                                                Expanded(
                                                  child: CustomContainer(
                                                      height: 20,
                                                      width: double.maxFinite,
                                                      child:
                                                          Text(data['cvs'] ?? '')),
                                                ),
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                const Text('Parity:',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w600)),
                                                const SizedBox(
                                                  width: 5,
                                                ),
                                                Expanded(
                                                  child: CustomContainer(
                                                      height: 20,
                                                      width: double.maxFinite,
                                                      child:
                                                          Text(data['resp'] ?? '')),
                                                )
                                              ],
                                            ),
                                            const SizedBox(height: 10,),
                                            Row(
                                              children: [
                                                const Text('Height(cm):',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w600)),
                                                const SizedBox(
                                                  width: 5,
                                                ),
                                                Expanded(
                                                  child: CustomContainer(
                                                      height: 20,
                                                      width: double.maxFinite,
                                                      child:
                                                          Text(data['cvs'] ?? '')),
                                                ),
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                const Text('Weight(kg):',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w600)),
                                                const SizedBox(
                                                  width: 5,
                                                ),
                                                Expanded(
                                                  child: CustomContainer(
                                                      height: 20,
                                                      width: double.maxFinite,
                                                      child:
                                                          Text(data['resp'] ?? '')),
                                                )
                                              ],
                                            ),
                                           const  SizedBox(height: 10,),
                                            Row(
                                              children: [
                                                const Text(
                                                    'Maritial status:',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w600)),
                                                const SizedBox(
                                                  width: 5,
                                                ),
                                                Expanded(
                                                  child: CustomContainer(
                                                      height: 20,
                                                      width: double.maxFinite,
                                                      child: Text(data[
                                                              'examination of the external genitals'] ??
                                                          '')),
                                                )
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Row(
                                              children: [
                                                const Text('County:',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w600)),
                                                const SizedBox(
                                                  width: 5,
                                                ),
                                                Expanded(
                                                  child: CustomContainer(
                                                      height: 20,
                                                      width: double.maxFinite,
                                                      child:
                                                          Text(data['cvs'] ?? '')),
                                                ),
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                const Text('Subcounty:',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w600)),
                                                const SizedBox(
                                                  width: 5,
                                                ),
                                                Expanded(
                                                  child: CustomContainer(
                                                      height: 20,
                                                      width: double.maxFinite,
                                                      child:
                                                          Text(data['resp'] ?? '')),
                                                )
                                              ],
                                            ),
                                            const SizedBox(height: 10,),
                                            Row(
                                              children: [
                                                const Text('Ward :',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w600)),
                                                const SizedBox(
                                                  width: 5,
                                                ),
                                                Expanded(
                                                  child: CustomContainer(
                                                      height: 20,
                                                      width: double.maxFinite,
                                                      child:
                                                          Text(data['cvs'] ?? '')),
                                                ),
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                const Text('Town:',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w600)),
                                                const SizedBox(
                                                  width: 5,
                                                ),
                                                Expanded(
                                                  child: CustomContainer(
                                                      height: 20,
                                                      width: double.maxFinite,
                                                      child:
                                                          Text(data['resp'] ?? '')),
                                                )
                                              ],
                                            ),
                                            const SizedBox(height: 10,),
                                            Row(
                                              children: [
                                                const Text('Estate:',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w600)),
                                                const SizedBox(
                                                  width: 5,
                                                ),
                                                Expanded(
                                                  child: CustomContainer(
                                                      height: 20,
                                                      width: double.maxFinite,
                                                      child:
                                                          Text(data['cvs'] ?? '')),
                                                ),
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                const Text('Physical adress:',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w600)),
                                                const SizedBox(
                                                  width: 5,
                                                ),
                                                Expanded(
                                                  child: CustomContainer(
                                                      height: 20,
                                                      width: double.maxFinite,
                                                      child:
                                                          Text(data['resp'] ?? '')),
                                                )
                                              ],
                                            ),
                                            const SizedBox(height: 10,),
                                            Row(
                                              children: [
                                                const Text('Next of kin:',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w600)),
                                                const SizedBox(
                                                  width: 5,
                                                ),
                                                Expanded(
                                                  child: CustomContainer(
                                                      height: 20,
                                                      width: double.maxFinite,
                                                      child:
                                                          Text(data['cvs'] ?? '')),
                                                ),
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                const Text('Relationship:',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w600)),
                                                const SizedBox(
                                                  width: 5,
                                                ),
                                                Expanded(
                                                  child: CustomContainer(
                                                      height: 20,
                                                      width: double.maxFinite,
                                                      child:
                                                          Text(data['resp'] ?? '')),
                                                )
                                              ],
                                            ),
                                            const SizedBox(height: 10,),
                                            Row(
                                              children: [
                                                const Text(
                                                    'Next of kin contacts:',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w600)),
                                                const SizedBox(
                                                  width: 5,
                                                ),
                                                Expanded(
                                                  child: CustomContainer(
                                                      height: 20,
                                                      width: double.maxFinite,
                                                      child: Text(
                                                          data['discharge'] ?? '')),
                                                )
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
          
                                //End of the container containig physical examination data
                                const SizedBox(
                                  height: 10,
                                ),
          
                                //Start of the Container containing the Antenatal profile data
                                Container(
                                  margin: const EdgeInsets.symmetric(horizontal: 5),
                                  height: 250,
                                  width: double.maxFinite,
                                  decoration: BoxDecoration(
                                    
                                      border: Border.all(
                                          width: 1, color: Colors.black)),
                                  child: Column(
                                    children: [
                                      Container(
                                        height: 45,
                                        color: Colors.grey,
                                        child: const Center(
                                            child: Text(
                                          'MEDICAL AND SURGICAL HISTORY',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18),
                                        )),
                                      ),
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10, vertical: 10),
                                        child: Column(
                                          children: [
                                            Row(
                                              children: [
                                                const Text('Surgical operation-specify:',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w500)),
                                                const SizedBox(
                                                  width: 5,
                                                ),
                                                Expanded(
                                                  child: CustomContainer(
                                                      height: 20,
                                                      width: double.maxFinite,
                                                      child:
                                                          Text(data['HB'] ?? '')),
                                                )
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Row(
                                              children: [
                                                const Text('Drug Allergy:',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w500)),
                                                const SizedBox(
                                                  width: 5,
                                                ),
                                                Expanded(
                                                  child: CustomContainer(
                                                      height: 20,
                                                      width: double.maxFinite,
                                                      child: Text(
                                                          data['Blood group'] ??
                                                              '')),
                                                )
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Row(
                                              children: [
                                                const Text('Other Allergies:',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w500)),
                                                const SizedBox(
                                                  width: 5,
                                                ),
                                                Expanded(
                                                  child: CustomContainer(
                                                      height: 20,
                                                      width: double.maxFinite,
                                                      child: Text(
                                                          data['Rhesus'] ?? '')),
                                                )
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Row(
                                              children: [
                                                const Text('Blood Transfusion:',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w500)),
                                                const SizedBox(
                                                  width: 5,
                                                ),
                                                Expanded(
                                                  child: CustomContainer(
                                                      height: 20,
                                                      width: double.maxFinite,
                                                      child: Text(
                                                          data['Urinalysis'] ??
                                                              '')),
                                                )
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Row(
                                              children: [
                                                const Text('Family History :',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w600)),
                                                const SizedBox(
                                                  width: 5,
                                                ),
                                                Expanded(
                                                  child: CustomContainer(
                                                      height: 20,
                                                      width: double.maxFinite,
                                                      child: Text(
                                                          data['Blood RBS'] ?? '')),
                                                )
                                              ],
                                            ),
                                            
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Row(
                                              children: [
                                                const Text('Diabetes :',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w600)),
                                                const SizedBox(
                                                  width: 5,
                                                ),
                                                Expanded(
                                                  child: CustomContainer(
                                                      height: 20,
                                                      width: double.maxFinite,
                                                      child: Text(
                                                          data['Date given'] ??
                                                              '')),
                                                ),
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                const Text('Hypertension :',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w600)),
                                                const SizedBox(
                                                  width: 5,
                                                ),
                                                Expanded(
                                                  child: CustomContainer(
                                                      height: 20,
                                                      width: double.maxFinite,
                                                      child: Text(
                                                          data['Next Visit'] ??
                                                              '')),
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                 //End of the container containing Antenatal profile data
          
                                const SizedBox(
                                  height: 15,
                                ),
                                GestureDetector(
                                  onTap: (){
                                    Get.to(AntenatalProfile());
                                  },
                                  child: Container(
                                    height: 50,
                                    width: 160,
                                    decoration: const BoxDecoration(
                                        borderRadius:
                                            BorderRadius.all(Radius.circular(25)),
                                        color: Colors.purple),
                                    child: const Center(
                                        child: Text(
                                      'Next',
                                      style: TextStyle(
                                          fontSize: 28,
                                          fontWeight: FontWeight.w800,
                                          color: Colors.white),
                                    )),
                                  ),
                                )
                               
                              ],
                            ),
                          );
                        },
                      );
                    }
                  },
                ),
              ),
                  
        ],
      )
    );
  }
}
