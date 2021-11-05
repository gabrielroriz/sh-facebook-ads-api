
# "In last X days"
DAYS_ARR=( 
    "3" 
    "5" 
    "7" 
    "14" 
    "21" 
    "30" 
    "60" 
    "90" 
    "120"
    "180" 
    "240" 
    "365" 
    "540" 
    "730"
)

# <EngagementID>::<EngagementDescription>
ENGAGEMENTS=(
    'ig_ad_like::Ad Likes'
    'ig_ad_comment::Ad Comments'
    'ig_ad_share::Ad Share'
    'ig_ad_save::Ad Save'
    'ig_ad_cta_click::Ad CTA Click'
    'ig_ad_carousel_swipe::Ad Carousel Swipe'
    'ig_organic_like::Organic Like'
    'ig_organic_comment::Organic Comment'
    'ig_organic_share::Organic Share'
    'ig_organic_save::Organic Save'
    'ig_organic_swipe::Organic Swipe'
    'ig_organic_carousel_swipe::Organic Carousel Swipe'
)

for index in "${ENGAGEMENTS[@]}" ; do
    FIELD="${index%%::*}"
    DESCRIPTION="${index##*::}"

    for DAYS in "${DAYS_ARR[@]}"; do
        sh ./create_ig_audience.sh "$DAYS" "$FIELD" "$DESCRIPTION"
        echo ":::✅";
    done;

    echo "=========================================="
done