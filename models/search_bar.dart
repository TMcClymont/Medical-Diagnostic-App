import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 40,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(30)),
      child: Center(
        child: TextField(
          decoration: InputDecoration(
              prefixIcon: Icon(Icons.search),
              suffixIcon: IconButton(
                icon: Icon(Icons.clear),
                onPressed: () {
                  /* Clear the search field */
                },
              ),
              hintText: 'Search for Doctors...',
              border: InputBorder.none),
        ),
      ),
    );
  }
}
// Container(
//   width: MediaQuery.of(context).size.width * 0.7,
//   //height: MediaQuery.of(context).size.width * 0.05,
//   padding: EdgeInsets.symmetric(horizontal: 30),
//   decoration: BoxDecoration(
//       color: Colors.purpleAccent,
//       borderRadius: BorderRadius.circular(30)),
//   child: TextField(
//     textAlign: TextAlign.center,
//     decoration:
//         InputDecoration.collapsed(hintText: 'Search for Doctors'),
//   ),
// ),
// Align(
//   alignment: Alignment.centerRight,
//   child: MaterialButton(
//     onPressed: () {},
//     padding: EdgeInsets.symmetric(
//         // horizontal: 10,
//         // vertical: 15,
//         ),
//     shape: RoundedRectangleBorder(
//       borderRadius: BorderRadius.circular(30),
//     ),
//     child: Icon(Icons.search),
//   ),
// ),
//       ],
//     );
//   }
// }

//
// Query query = FirebaseFirestore.instance.collection('apartments');
// if (city.isNotEmpty && city != "Any") {
// query = query.where("city", isEqualTo: city)
// }
// if (zipCode.isNotEmpty && zipCode != "Any") {
// query = query.where("zipCode", isEqualTo: zipCode)
// }
// ...
// QuerySnapshot snapshot = await query.get();
// List<PersonalApartment> apartments = snapshot.docChanges.map(
//       (result) => PersonalApartment.fromFirestore(result.doc),
// );
// Query _buildQuery() {
//   Query query = FirebaseFirestore.instance.collection('apartments');
//
//   // SIMPLE QUERIES
//   if (city.isNotEmpty && city != "Any") {
//     query = query.where("city", isEqualTo: city)
//   }
//   if (zipCode.isNotEmpty && zipCode != "Any") {
//     query = query.where("zipCode", isEqualTo: zipCode)
//   }
//
//   // RANGE QUERIES
//   if (minPrice != null || maxPrice != null) {
//     if (minPrice != null) {
//       query = query.where("price", ">=", minPrice);
//     }
//     if (maxPrice != null) {
//       query = query.where("price", "<=", maxPrice);
//     }
//     return query;
//   }
//   if (minArea != null || maxArea != null) {
//   ...
//   return query;
//   }
//   if (...) { ... }
//   ...
//   return query;
// }
//
// ...
//
// QuerySnapshot snapshot = await _buildQuery().get();
// List<PersonalApartment> apartments = snapshot.docChanges.map(
//       (result) => PersonalApartment.fromFirestore(result.doc),
// );
// apartments = apartments.where((apartment) { /* perform remaining filters clmient-side */ })
