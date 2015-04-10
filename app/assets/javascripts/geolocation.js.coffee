if navigator.geolocation
  navigator.geolocation.getCurrentPosition (geoData) ->
    $('.location').html("#{geoData.coords.latitude} #{geoData.coords.longitude}")
