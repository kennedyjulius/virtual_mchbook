import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:testsdk/common/utils/custom_containerutil.dart';

class AntenatalProfile extends StatelessWidget {
  AntenatalProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //AppBar
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.purple,
        title: const Text(
          'TEST DATA RESULTS',
          style: TextStyle(color: Colors.white),
        ),
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: FutureBuilder(
              future: FirebaseFirestore.instance.collection('handbook').get(),
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
                        
                        height: 750,
                        width: double.maxFinite,
                        child: Column(
                          children: [
                            Container(
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 5, vertical: 15),
                              height: 220,
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
                                        'PHYSICAL EXAMINATION',
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
                                              'General Examination:',
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
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          children: [
                                            const Text('BP:',
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
                                                      Text(data['bp'] ?? '')),
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            const Text('Pulse Rate:',
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
                                            const Text('CVS:',
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
                                            const Text('Resp:',
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
                                            const Text(
                                                'Examination of the external genitalia:',
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
                                            const Text(
                                                'Discharge/genital Ulcer:',
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
                              height: 400,
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
                                      'ANTENATAL PROFILE',
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
                                            const Text('HB:',
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
                                            const Text('Blood Group:',
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
                                            const Text('Rresus:',
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
                                            const Text('Urinalysis:',
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
                                            const Text('Blood RBS:',
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
                                        const Center(
                                          child: Text(
                                            'TB Screening as per the intensive case finding tool',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w900),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          children: [
                                            const Text('Screening Outcome:',
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
                                                          'Screening outcome'] ??
                                                      '')),
                                            )
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        const Center(
                                          child: Text(
                                            'Isoniazed Preventive Therapy(IPT)',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w900),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 8,
                                        ),
                                        Row(
                                          children: [
                                            const Text('Date given:',
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
                                            const Text('Next Visit:',
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

                            const SizedBox(
                              height: 30,
                            ),
                            Container(
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
                            )
                            //End of the container containing Antenatal profile data
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
      ),
    );
  }
}
