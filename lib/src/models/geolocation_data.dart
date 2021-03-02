import 'package:meta/meta.dart' show required;

class GeolocationData{
    final String country, countryCode, timezone, ip, region, regionName, city, isp ;
    final double lat, lng, zip;

    GeolocationData({
        @required this.country,
        @required this.countryCode,
        @required this.timezone,
        @required this.ip,
        @required this.region,
        @required this.regionName,
        @required this.city,
        @required this.isp,
        @required this.lat,
        @required this.lng,
        @required this.zip,
    });

    factory GeolocationData.fromJson(Map<String, dynamic> json){
        return GeolocationData(
            country: json['country'],
            countryCode: json['countryCode'],
            timezone: json['timezone'],
            region: json['region'],
            regionName: json['regionName'],
            city: json['city'],
            isp: json['isp'],
            ip: json['query'],
            lat: json['lat'],
            lng: json['lon'],
            zip: json['zip'],
        );
    }
    Map<String, dynamic> toJson(){
        return {
            'country': this.country,
            'countryCode': this.countryCode,
            'timezone': this.timezone,
            'region': this.region,
            'regionName': this.regionName,
            'city': this.city,
            'isp': this.isp,
            'ip': this.ip,
            'lat': this.lat,
            'lng': this.lng,
            'zip': this.zip,
        };
    }
}
