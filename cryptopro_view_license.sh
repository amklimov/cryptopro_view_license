#!/usr/bin/env bash

PGS=$(/usr/local/bin/kubectl get po -A | grep -e Running, -e <YOUR_POD_crypto-backend> | head -1 | awk '{print $1 "," $2}' | xargs -n1)

for p in ${PGS[*]}; do

 NS=${p%,*}
 POD=${p#*,}

 for pod in ${POD[*]}; do
   DF=($(/usr/local/bin/kubectl exec -t -n $NS $pod -- /opt/cprocsp/sbin/amd64/cpconfig -license -view | grep 'Expires:' | awk '{print $2}'))
   if echo $DF -le 14
   then echo -e {\"license\": \"$DF\"}
   else :
   fi
 done
done
