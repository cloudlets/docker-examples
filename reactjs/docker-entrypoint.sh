#!/bin/sh

echo 'var env = {};' > /usr/share/nginx/html/env.js;

# Add REACT-environment variables to /usr/share/nginx/html/env.js
for x in `printenv | grep REACT_APP`; 
do echo $x | sed "s/REACT_APP_/env./" | sed "s/\=/\ \=\ '/" | sed "s/$/';/" >> /usr/share/nginx/html/env.js; 
done

# Start nginx
nginx -g "daemon off;"