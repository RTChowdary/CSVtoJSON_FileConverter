## Converter Class 

Converter = require("csvtojson").Converter
csvConverter = new Converter({})
fs = require 'fs'
csvFileName = "./data.csv"

jsonfile = require 'jsonfile'
file = './output_data.json'

## end_parsed will be emitted once parsing finished
csvConverter.on "end_parsed", (jsonArray) ->
	obj = jsonArray
	jsonfile.writeFileSync file, obj, {spaces: 4}, (err) -> 
		console.error err

## read from file 
fs.createReadStream(csvFileName).pipe(csvConverter)
