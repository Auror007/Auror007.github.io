+++
title = "Projects"
slug = "projects"
+++

### NPM Registry Follower

###### Summary

This project aims to solve the problem of detecting malicious packages in npm registry.
Attackers usually try to achieve code execution using install scripts in the package.json file.
This can be monitored using a simple script which collects all the change events from the npm steam
and perform grep for commandline keywords such as "bash","curl","wget" etc.