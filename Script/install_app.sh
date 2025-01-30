#!/bin/bash

sudo apt update -y
sudo apt install nginx -y

echo "<h1>Hello World from  $(hostname)!</h1>" | sudo tee /var/www/html/index.html

sudo systemctl start nginx
sudo systemctl enable nginx