//@dart=2.9
import 'package:flutter/cupertino.dart';
import 'package:geocoder/geocoder.dart';
import 'package:get/get.dart';
import 'package:kashif/model_classes/GetAllRecords.dart';
import 'package:kashif/model_classes/GetCardInfoByCardID.dart';
import 'package:kashif/model_classes/GetCustomerVehicle.dart';
import 'package:kashif/model_classes/GetLifters.dart';
import 'package:kashif/model_classes/getCardsListByVehicleId.dart';
import 'package:kashif/model_classes/getVehicleMakers.dart';
import 'package:kashif/model_classes/get_vehicle_services.dart';
import 'package:kashif/screens/order_taking_screens/ongoing_inspection_pickup_address.dart';
import 'package:kashif/utils.dart';

class DashboardProvider extends ChangeNotifier{

  bool isVehicleMakerLoaded=false;
  GetVehicleMaker getVehicleMaker;
  bool isServiceDataLoaded=false;
  GetVehicleServices vehicleServicesFromJson;
  String carMakeId="";
  String carMakeModelId="";
  String manufacturYear="";
  String vinCode="";
  String numberPlateEnglish="";
  String numberPlateDigits="";
  String serviceTyoeId='';
  String vat_percentage='';
  String vatValue='';
  GetCardInfoByCardId cardInfoByCardIdFromJson;
  bool isSingleCardLoaded=false;

  int carLifterId=-1;
  int carLifterIndex=-1;
  int orderType=1;
  int notificationNumber=0;

  int initialScreen = 0;

  setVehicleMakers(bool isVehicleMakerLoaded,GetVehicleMaker getVehicleMaker ){
    this.getVehicleMaker=getVehicleMaker;
    this.isVehicleMakerLoaded=isVehicleMakerLoaded;
    notifyListeners();
  }

  btnNextForTimeAndAddress() {
    print(carMakeId);
    print(manufacturYear);
    print(carMakeModelId);
    print(vinCode);
    print(numberPlateEnglish);
    if (carMakeId.isEmpty ||
        manufacturYear.isEmpty ||
        carMakeModelId.isEmpty ||
        vinCode.isEmpty ||
        serviceTyoeId.isEmpty ||
        numberPlateEnglish.isEmpty ||
        numberPlateDigits.isEmpty
    )
    {
      showMessage("incomplete information");
      return;
    }

    Get.to(OngoingInspectionPickUpAddressUi());
  }
    double lat;
    double lng;
    String location="";
  void setAddress(var value) {
    if(value==null) return;
    lat=value[0];
    lng=value[1];
    geoCoder(lat,lng);


  }
  Address address;
  void geoCoder(double lat, double lng) async {
    print(lat);
    print(lng);

    // From a query
    // final query = "1600 Amphiteatre Parkway, Mountain View";
    // var addresses = await Geocoder.local.findAddressesFromQuery(query);
    // var first = addresses.first;
    // print("${first.featureName} : ${first.coordinates}");

    // From coordinates
    final coordinates = new Coordinates(lat, lng);
    List<Address> addresses =
    await Geocoder.local.findAddressesFromCoordinates(coordinates);
    Address address = addresses.first;
    print(address.addressLine);
    location=address.addressLine;
    await getAddresses();
    notifyListeners();
    // setState(() {
    //   data.setlocation(address.addressLine, lat, lng);
    // });
    // print(address.adminArea);
    // print(address.countryCode);
    // print(address.countryName);
    // print(address.featureName);
    // print(address.thoroughfare);
  }
  getAddresses() async {
    print(lat);
    print(lng);

    // From a query
    // final query = "1600 Amphiteatre Parkway, Mountain View";
    // var addresses = await Geocoder.local.findAddressesFromQuery(query);
    // var first = addresses.first;
    // print("${first.featureName} : ${first.coordinates}");

    // From coordinates
    final coordinates = new Coordinates(lat, lng);
    List<Address> addresses =
    await Geocoder.local.findAddressesFromCoordinates(coordinates);
    address = addresses.first;
    return address;
    // print(address.addressLine);
    // location=address.addressLine;

    // setState(() {
    //   data.setlocation(address.addressLine, lat, lng);
    // });
    // print(address.adminArea);
    // print(address.countryCode);
    // print(address.countryName);
    // print(address.featureName);
    // print(address.thoroughfare);
  }
  void setVehicleServices(bool isServiceDataLoaded, GetVehicleServices vehicleServicesFromJson) {
    this.isServiceDataLoaded=isServiceDataLoaded;
    this.vehicleServicesFromJson=vehicleServicesFromJson;
    notifyListeners();

  }
  String getTimeSlot="";
  void setTimeslot(String getTimeSlot) {
    this.getTimeSlot=getTimeSlot;
    notifyListeners();
  }
  void setCardInformation(GetCardInfoByCardId cardInfoByCardIdFromJson,bool isSingleCardLoaded) {

        this.isSingleCardLoaded=isSingleCardLoaded;
        this.cardInfoByCardIdFromJson=cardInfoByCardIdFromJson;
        notifyListeners();

  }
  bool isGetLifterDataLoaded=false;
  GetLifters getLifters;
  void setLifterData(bool value, GetLifters liftersFromJson) {
    this.getLifters=liftersFromJson;
    isGetLifterDataLoaded=value;
    notifyListeners();

  }
  void resetOrderVaribales() {
    isGetLifterDataLoaded=false;
    isSingleCardLoaded=false;
    getTimeSlot="";
    isServiceDataLoaded=false;
    address=null;
    location='';
    isVehicleMakerLoaded=false;

    carMakeId="";
    carMakeModelId="";
    manufacturYear="";
    vinCode="";
    numberPlateEnglish="";
    numberPlateDigits="";
    serviceTyoeId='';


  }

  bool isAllRecordsLoaded=false;
   GetAllRecords allRecordsFromJson;
  void setAllCardRecords(bool value, GetAllRecords allRecordsFromJson) {
    this.isAllRecordsLoaded=value;
    this.allRecordsFromJson=allRecordsFromJson;
    notifyListeners();


  }
  GetCustomerVehicle customerVehicleFromJson;
  bool isVehiclesLoaded=false;
  void setCustomerVehicles(GetCustomerVehicle customerVehicleFromJson, bool isVehiclesLoaded) {
    this.isVehiclesLoaded=isVehiclesLoaded;
    this.customerVehicleFromJson=customerVehicleFromJson;
    notifyListeners();

  }
  GetCardsListByVehicleId cardsListByVehicleIdFromJson;
  bool isCardListLoadedbyVehicle=false;

  void setCardsListByVehicleId(GetCardsListByVehicleId cardsListByVehicleIdFromJson, bool isCardListLoaded) {
    this.cardsListByVehicleIdFromJson=cardsListByVehicleIdFromJson;
    this.isCardListLoadedbyVehicle=isCardListLoaded;
    notifyListeners();

  }

}