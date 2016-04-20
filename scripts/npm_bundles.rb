#!/usr/bin/env ruby

puts "Running Node version: #{`node --version`}"
npms = {
  # module name => module command
  # leave command blank if they are the same
  "browser-sync" => "",
  "casperjs" => "",
  "express" => "",
  "grunt-cli" => "grunt",
  "gulp" => "",
  "mocha" => "",
  "nodemon" => "",
  "phantomjs" => "",
  "react-native-cli" => "",
  "webpack" => ""
}

npms.each do |mod, command|
  cmd = (command == "" ? mod : command)
  if `which #{cmd}` == ""
    puts "Installing #{mod}"
    `npm install #{mod} -g`
  end
end
