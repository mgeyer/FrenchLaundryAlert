# Cron Alerts

## How To Use
- Create an AWS SNS Topic with SMS subscription

- Add the script to a new EC2Host (Just copy and paste, and update target-arn)

- Edit Crontab to run the script however often you want. Example: `*/1 * * * * /bin/bash /home/ec2-user/bin/vaccine-alert.sh > /tmp/vaccine-outpout`
