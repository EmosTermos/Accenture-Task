#!/bin/bash

sudo apt update -y
sudo apt install nginx -y

cat <<EOF | tee /etc/nginx/conf.d/load_balancer.conf

upstream vm_servers {
    server ${vm1_private_ip}:80;
    server ${vm2_private_ip}:80;
}

server {
    listen 80;

    location = / {
        if ($query_string != "") {
		    return 403;
    	}

        proxy_pass http://vm_servers;
        proxy_set_header Host \$host;
        proxy_set_header X-Real-IP \$remote_addr;
    }
}

EOF

sed -i 's|^\(\s*include /etc/nginx/sites-enabled/\*;\)|#\1|' /etc/nginx/nginx.conf

sudo systemctl restart nginx
sudo systemctl enable nginx 