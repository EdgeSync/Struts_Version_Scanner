# Scanning Versions of Struts	

With ongoing vulnerabilities being discovered in the Apache Struts framework, I began to think about ways we could identify any possible vulnerable versions of Struts.

Vulnerability scanners have one flaw for detecting this - they do not check the version - rather they attempt to exploit the vulnerability, and depending if it's successful or not will deem the software as not vulnerable.
It can often be weeks before these vulnerability scanners get an exploit which is capable of doing this. 

So is there any way we can scan a domains/IP's:Ports to see if we can return a server version?

This proof of concept code checks and attemps to pull back the JSP file for that version of Apache Struts - which works in a test environment under default configurations.

## My Lab Setup

First of all, you will need to install the following:

```
Apache-Tomcat (I have used apache-tomcat-7.0.90)  
Apache Struts (I have used struts2-showcase-2.3.14)  
curl  
```

Install and run Tomcat.  

Don't forget to configure a user account if needed. This user account needs access to admin-gui and manager-gui.

Get your struts .war file, and load it into Tomcat, and start it.

By default mine ran on port 8080.  

So if i go to http://127.0.0.1:8080/struts2-showcase-2.3.14 it will direct me to the struts landing page.  

You should see somthing like:
!(https://raw.githubusercontent.com/EdgeSync/Struts_Version_Scanner/master/images/struts_running.png)


### check_struts_version.sh

running the script takes another file as an argument:

```
bash check_struts_version.sh sample_ips.txt
```

The script is hardcoded with all the versions of apache struts that where available when I wrote it.
The script will attempt to curl the "showcase.jsp" file for each version of struts. This is akin to the "index.html" file in Apache, and redirects users to the main page.  

We then run the script and it will check if it can access the showcase.jsp file.

This returns a HTTP_STATUS_CODE - we are looking for a 200 - which means this file is available.

On my lab setup with default configuration, I am able to verify the version as I can pull back the showcase.jsp. 

!(https://raw.githubusercontent.com/EdgeSync/Struts_Version_Scanner/master/images/struts_check.png)


