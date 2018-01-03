***Settings ***
Documentation	Login into GitHub
Library     RequestsLibrary
Library     XML
Library     Collections

*** Test cases ***
Valid GitHub Login
	[Documentation]		Login with Valid Username and Password
	[Tags]				Positive Test case
    ${root}             Parse XML       test_data.xml
    ${User_name}=       Get Element     ${root}     Username
    ${Password}=        Get Element     ${root}     Password
    @{Cred}             create list     ${User_name.text}  ${Password.text}
    Create Session   	github    https://api.github.com   verify=True   auth=@{Cred}
    ${resp}=  			GET Request    github  /user
	log to console    	\n=> Response Status Code: ${resp.status_code}
    log to console    	\n=> Response: ${resp.text}
	Should Be Equal As Strings      ${resp.status_code}     200

