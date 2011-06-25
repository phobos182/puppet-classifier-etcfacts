# Puppet-Classifier: /etc/facts.txt

## Description

This classifier is based upon the [etc_facts.rb](https://github.com/ripienaar/facter-facts/blob/master/etcfacts/etc_facts.rb) plugin written by R.I.Pienaar. The classifier looks for the <tt>classes</tt> and <tt>parameters</tt> facts set by the etc_facts.rb script. The script parses the <tt>classes</tt> fact split by "," and assigns the corresponding class to the node. The script then looks for <tt>parameter</tt> and then breaks it down into a key and a value delimited by ":". These parameters are used in puppet manifests as local variables for configuration overrides.

/etc/facts.txt
	parameters=tomcatMem:4g
	classes=ntp,tomcat

Output
	     --- 
	       parameters: 
	         tomcatMem: 4g
	       classes: 
	         - tomcat
	         - ntp
	       environment: production

## Requirements

You have to have the [etc_facts.rb](https://github.com/ripienaar/facter-facts/blob/master/etcfacts/etc_facts.rb) facter plugin installed on all of your mcollective / puppet nodes.

## Puppet installation

You can follow the instructions to install a [external nodes](http://docs.puppetlabs.com/guides/external_nodes.html) script. You will modify the line to point to the <tt>puppet-etcfacts.rb</tt> script
     
## Changes?
========

2011/04/01 - First revision

## Contact?
========

Jeremy Carroll <phobos182@gmail.com> @jeremy_carroll
