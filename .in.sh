#!/bin/bash
for account in $(awk '$3>1000 && $1!="nobody" { print $1 }' FS=':' /etc/passwd)

do 
  expiers_string="$(sudo chage -l "$account" | grep 'Account expires' | awk '{print $4, $5, $6}')"
  changed_date="$(sudo chage -l "$account" | grep 'Last password change' | awk '{print $5, $6, $7}')"
  echo "ACCOUNT: $account , EXPIRES: $expiers_string, CHANGED: $changed_date"
done
