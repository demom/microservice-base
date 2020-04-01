# We're using official latest alpine as base
FROM alpine:latest

# First off, we install all our needed dependencies
apk add --update tzdata nodejs npm


# As Alpine lacks timezone support - lets add stockholm and then remove the rest
cp /usr/share/zoneinfo/Europe/Stockholm /etc/localtime
echo "Europe/Stockholm" >  /etc/timezone
apk del tzdata

# Now we should install the basic npm dependencies we have
npm install @deepstream/client

# Lets create the data dir
mkdir -p /data
cd /data

# This is the start command
CMD ["npm","start"]
