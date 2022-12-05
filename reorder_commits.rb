#!/usr/bin/ruby

path = File.path(ARGV.first)
commits = File.readlines(path, chomp: true).map do |line|
  line.split(" ")[2]
end

puts "Processing #{commits.length} commits."

commits.reverse!

puts "First commit sha is now: #{commits[0]}"
puts "Last commit sha is now: #{commits[-1]}"

File.open("reordered_commits_#{Time.now.to_i}.txt", "w") do |file|
  commits.each do |commit|
    file << commit + "\n"
  end
end