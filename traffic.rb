#!/usr/bin/env ruby

require_relative "fetcher"


unless ARGV.length == 0
  print "No arguments\n\n"
  exit
end

@sym = {word: ARGV[0]}
report = Fetchers::Traffic.new(@sym)

report.fetch

print "\n\nHTTP Status: ", report.data[:code], "\n\n"

if report.data[:code].include? '404'
  print "Unknown\n\n"
  exit
end

#print "Incidents:     ", report.data[:incidents], "\n"
print "\n\n"
