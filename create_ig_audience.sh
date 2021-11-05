DAYS=$1;
FIELD=$2; 
DESCRIPTION=$3;

PAGE_ID="4485298641544770" # Identificador da Página do Instagram
ACCESS_TOKEN="" # Access Token
AD_ACCOUNT_ID="596758467586352" # Identificador da Conta de Anúncios

curl -X POST \
  -F "name=\"[IG] @medclass_tv - ${DESCRIPTION} - ${DAYS}D\"" \
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