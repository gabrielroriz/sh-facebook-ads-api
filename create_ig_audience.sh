DAYS=$1;
FIELD=$2; 
DESCRIPTION=$3;

PAGE_ID="4485298641544770" # @lavros.oficial
ACCESS_TOKEN="EAABsbCS1iHgBACYolYznDGWTIayRcSGoyqN3IZBgPxOyom02ORmTZC6JFj2kjB9Jd13HEUcb9XAUNStQqmd2t9xpfCWtlsbw6ztIQkNJDA7ZB8VZB1EzCcMuU6SZCL0Psofv3QkyCgR0zt2s0xp5K7Xv7YxHqkhbl7RQ4HN9Es5fZBpbtw4DQMYfdzzfB2OO0ZD"
AD_ACCOUNT_ID="596758467586352" # CA - Lavros

curl -X POST \
  -F "name=\"[LV] IG - ${DESCRIPTION} - ${DAYS}D\"" \
  -F "rule={
       \"inclusions\": {
         \"operator\": \"or\",
         \"rules\": [
           {
             \"event_sources\": [
               {
                 \"id\": \"${PAGE_ID}\",
                 \"type\": \"ig_business\"
               }
             ],
             \"retention_seconds\": $(( DAYS * 86400 )),
             \"filter\": {
               \"operator\": \"and\",
               \"filters\": [
                 {
                   \"field\": \"event\",
                   \"operator\": \"eq\",
                   \"value\": \"${FIELD}\"
                 }
               ]
             }
           }
         ]
       }
     }" \
  -F "prefill=1" \
  -F "access_token=${ACCESS_TOKEN}" \
  https://graph.facebook.com/v12.0/act_${AD_ACCOUNT_ID}/customaudiences;