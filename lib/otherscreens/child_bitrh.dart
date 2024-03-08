import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:testsdk/common/utils/custom_containerutil.dart';

class ChildBirth extends StatelessWidget {
  ChildBirth({super.key});

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
              future: FirebaseFirestore.instance.collection('childBirth').get(),
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
                        
                        height: 900,
                        width: double.maxFinite,
                        child: Column(
                          children: [
                      
                            const SizedBox(
                              height: 10,
                            ),

                            //Start of the Container containing the child birth  data
                            Container(
                              margin: const EdgeInsets.symmetric(horizontal: 5),
                              height: 600,
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
                                      'CHILD BIRTH',
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
                                            const Text('Duration of pregnancy:',
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
                                                      Text(data['Duration of Pregnancy'] ?? '')),
                                            )
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          children: [
                                            const Text('Hiv Tested:',
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
                                        const Center(
                                          child: Text(
                                            'If HIV test not done or Negative at ANC,Councel and Test',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w900),
                                          ),
                                        ),
                                        const CustomContainer(
                                          height: 20,
                                          width: 180,
                                          child: Text('Reactive')),
                                          const SizedBox(height: 10,),
                                        Row(
                                          children: [
                                            const Text('Model of Delivery:',
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
                                            const Text('Date :',
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
                                            ),
                                            const SizedBox(width: 10,),
                                            const Text('Time :',
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
                                            const Text('Blood Loss:',
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
                                            'Meconium stained liquor (grade)0,1,2,3,',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w900),
                                          ),
                                        ),
                                       const SizedBox(height: 10,),
                                        Row(
                                          children: [
                                            const Text(' Stained by:',
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
                                            'Drugs administered at childbirth:',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w900),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 8,
                                        ),
                                        Row(
                                          children: [
                                            const Text('Mother:',
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
                                           
                                          ],
                                        ),
                                       const SizedBox(height: 10,),
                                         Row(
                                          children: [
                                            const Text('Child:',
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
                                           
                                          ],
                                        ),
                                        const SizedBox(height: 10,),
                                        const Center(
                                          child: Text(
                                            'Child Details:',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w900),
                                          ),
                                        ),
                                        const SizedBox(height: 10,),
                                        Row(
                                          children: [
                                            const Text('Bitrh Weight gms:',
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
                                           
                                          ],
                                        ),
                                        const SizedBox(height: 10,),
                                        Row(
                                          children: [
                                            const Text('Birth Length cm:',
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
                                           
                                          ],
                                        ),
                                        const SizedBox(height: 10,),
                                        Row(
                                          children: [
                                            const Text('Head circumfrence:',
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
                                           
                                          ],
                                        ),
                                        const SizedBox(height: 10,),
                                        Row(
                                          children: [
                                            const Text('Place of Birth:',
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
