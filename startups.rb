require_relative 'vendor/bundle/bundler/setup'

require 'alfredo'
require 'json'
require 'net/http'
require 'uri'

require_relative 'betalist'

betalist = BetaList.new(ARGV[0])
workflow = Alfredo::Workflow.new

betalist.startups.each do |startup|
  workflow << Alfredo::Item.new(
    uid: startup['id'],
    title: startup['name'],
    subtitle: startup['pitch'],
    arg: startup['url']
  )
end

workflow.output!
