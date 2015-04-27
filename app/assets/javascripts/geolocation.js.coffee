$ ->
  if navigator.geolocation
    navigator.geolocation.getCurrentPosition (geoData) ->
      $('.location').html("#{geoData.coords.latitude} #{geoData.coords.longitude}")
      $.getJSON "/search?lat=#{geoData.coords.latitude}&lon=#{geoData.coords.longitude}", (data) ->
        $('.venues').html($.parseJSON(data))
        
