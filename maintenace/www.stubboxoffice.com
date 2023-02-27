server {
    listen 80;
	listen [::]:80;
    server_name stubboxoffice.com www.stubboxoffice.com; 
    return 301 https://stubboxoffice.com$request_uri;
}


server {
    listen 443;
    ssl on;
    ssl_protocols TLSv1 TLSv1.1 TLSv1.2;
    ssl_certificate /etc/nginx/ssl/stubboxoffice_com.crt;
    ssl_certificate_key /etc/nginx/ssl/stubboxprivatekey.key;

    server_name stubboxoffice.com  www.stubboxoffice.com;
#    access_log /path/to/nginx/accces/log/file;
#    error_log /path/to/nginx/error/log/file;

    location / {
        root  /home/twstub/public_html;
       
    }
}
