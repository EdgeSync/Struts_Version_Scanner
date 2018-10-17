echo "Checking if struts jsp exists"

while IFS='' read -r line || [[ -n "$line" ]]; do
    url="$line"
    uri="/struts2-showcase-"
    file="/showcase.jsp"
    versions=( "2.5.16" "2.5.14.1" "2.5.14" "2.3.34" "2.5.13" "2.5.12" 
               "2.3.33" "2.5.10.1" "2.3.32" "2.5.10" "2.5.8" "2.5.5" 
               "2.3.31" "2.5.2" "2.3.30" "2.5.1" "2.5" "2.3.28.1" 
               "2.3.28" "2.3.24.3" "2.3.20.3" "2.3.24.1" "2.3.24" 
			   "2.3.20.1" "2.3.20" "2.3.16.3" "2.3.16.2" "2.3.16.1" 
			   "2.3.16" "2.3.15.3" "2.3.15.2" "2.3.15.1" "2.3.15" 
			   "2.3.14.3" "2.3.14.2" "2.3.14.1" "2.3.14" "2.3.12" 
			   "2.3.8" "2.3.7" "2.3.4.1" "2.3.4" "2.3.3" "2.3.1.2" 
			   "2.3.1.1" "2.3.1" "2.2.3.1" "2.2.3" "2.2.1.1" "2.2.1" 
			   "2.1.8.1" "2.1.8" "2.1.6" "2.0.14" "2.0.12" "2.0.11.2" )
 
    echo "trying versions for server $url"
    
for i in "${versions[@]}"
    do
        code=$(curl -s -o /dev/null -w"%{http_code}" -A "STRUTS VERSION SCANNER - EMAIL SAMPLE@SAMPLE.COM FOR INFORMATION" --url $url$uri$i$file)
	
	if [ "$code" == "200" ]
        then
		echo "found version $i on $url"
	fi
    done

done < "$1"


