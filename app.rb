require 'net/http'
require 'uri'
require 'json'

# get the weather report from the server
def getWeatherReport()
  uri = URI.parse("http://api.openweathermap.org/data/2.5/weather?q=London,uk&appid=39c87e2ece1743a22dcd4ac4fec1f32b&units=metric")
  response = Net::HTTP.get_response(uri)
  return JSON.parse(response.body)
end

# generate the report
def generateReport()
  weather = getWeatherReport()
  puts "The weather in London is #{weather['weather'][0]['description']}"
  puts "The temperature is #{weather['main']['temp']}"
  puts "The humidity is #{weather['main']['humidity']}"
end

# run the report
generateReport()
