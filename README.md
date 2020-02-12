# Arena
This repository contains the tools necessary to run MegaMinerAI Tournaments.

# GCP Project
Before running the Arena, you must have a Google Cloud Platform project set up.
This should already be done, but if not, here are the steps:
1. Create new project
2. Enable APIs and Services on dashboard (scroll down, left side)
3. Click +Enable APIs and Services at top
4. Scroll down and click Compute Engine API
5. Click ENABLE and wait
6. Click Create Credentials at the top right
7. Compute Engine API, Yes
Manually create the firewall rules, so terraform doesn't destroy them.
VPC→Firewall

New Rule
name: allow-webservices
network: default
target tags: allow-webservices
allow
source filters: ip ranges: 0.0.0.0/0
protocols:
	tcp: 80, 443, 8080, 8000
	icmp

Now, there is a default Compute Engine API service account.
9. Create a key for it as a JSON. Save this in the secrets folder.
10. Create main.tf, replacing the project name with your own.
11. The resource google_compute_instance default should work.

Ansible Piece:
1. Generate SSH key: ssh-keygen -t rsa -b 4096 -C "ansible"
2. apt install xsel 
3. cat ~/.ssh/id_rsa.pub | xsel -ib
4. Go to Compute Engine -> Metadata -> SSH keys -> Add new one and paste

Assuming you have pip installed...
5. pip install ansible 
6. 
