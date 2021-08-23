class CityCountryVm{
 int id;
    int cityId;
    String countryName;
    String cityName;


CityCountryVm ({
required this.id,
        required this.cityId,
        required this.cityName,
        required this.countryName,
  });
   factory CityCountryVm.fromJson(Map<String, dynamic> json) => CityCountryVm(
        id: json["Id"],
        countryName: json["CountryName"],
        cityId: json["CityId"],
        cityName: json["CityName"],
       
    );

}