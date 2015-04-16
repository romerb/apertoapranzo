$(document).ready -> 
  if navigator.geolocation
    navigator.geolocation.getCurrentPosition (geoData) ->
      $('.location').html("#{geoData.coords.latitude} #{geoData.coords.longitude}")
  else
    $('.location').html("41.881539800000006 12.501875199999999")