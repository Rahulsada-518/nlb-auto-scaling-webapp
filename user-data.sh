#!/bin/bash
dnf update -y
dnf install -y httpd
systemctl enable httpd
systemctl start httpd

INSTANCE_ID=$(curl -s http://169.254.169.254/latest/meta-data/instance-id)

cat > /var/www/html/index.html <<EOF
<h1>🚀 Scalable Web App with NLB</h1>
<h2>Served by EC2 Instance: $INSTANCE_ID</h2>
<p>Network Load Balancer + Auto Scaling Project</p>
EOF