#!/usr/bin/ruby

require 'yaml'
require 'puppet'

# Intitialize Variables
vardir = "/var/lib/puppet/yaml/facts/"
default = {'classes' => []}
yaml_output = {}
parameters = {}

# Check to see if the Node YAML file exists.
# If it exists, set the classes variable to that fact's value
begin
  yamlfile = YAML::load_file(vardir + ARGV[0] + '.yaml').values
  classes = yamlfile["classes"]
  paramlist = yamlfile["parameters"]
  if !(paramlist.nil? || paramlist.empty?)
    paramlist.each do |key|
      key = key.split(',')
      key.each do |val|
       value = val.split(':')
       length = value.length
       parameters[value[0]] = value[1..length].join(",")
      end
    end
  end
  environment = yamlfile["environment"]
  
rescue Exception => error
  puts "Node YAML file was not found!  Error: " + error
  exit(1)
end

# If classes is nil, escape with a blank YAML output
if classes.nil?
  print default.to_yaml
  exit(0)
end

# Output our classes and environment values to YAML for Puppet
# Output parameters if found in the facts.txt file
if parameters.empty?
  yaml_output =  {'classes' => classes.split(','), 'environment' => environment}
else
  yaml_output =  {'classes' => classes.split(','), 'environment' => environment, 'parameters' => parameters }
end
print yaml_output.to_yaml
