# Puppet-Classifier: /etc/facts.txt

This classifier is based upon the [etc_facts.rb](https://github.com/ripienaar/facter-facts/blob/master/etcfacts/etc_facts.rb) plugin written by R.I.Pienaar. The classifier looks for the <tt>classes</tt> and <tt>parameters</tt> facts set by the etc_facts.rb script. The script parses the <tt>classes</tt> fact split by "," and assigns the corresponding class to the node. The script then looks for <tt>parameter</tt> and then breaks it down into a key and a value delimited by ":". These parameters are used in puppet manifests as local variables for configuration overrides.

/etc/facts.txt
     parameters=tomcatMem:4g
     classes=ntp,tomcat

Output
     --- 
       parameters: 
         tomcatMem: 1g
       classes: 
         - tomcat
         - ntp
       environment: production
     
## Changes?
========

2011/04/01 - First revision

## Contact?
========

Jeremy Carroll <phobos182@gmail.com> @jeremy_carroll
