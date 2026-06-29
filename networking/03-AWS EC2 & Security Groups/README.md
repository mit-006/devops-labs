EC2 Instance
Amazon EC2 (Elastic Compute Cloud) is a service provided by AWS that allows users to create virtual servers in the cloud. 
A Security Group acts as a virtual firewall that controls inbound and outbound network traffic for an EC2 instance.

Security Groups
Security Group is a virtual firewall attached to an EC2 instance.
It controls which traffic is allowed to enter (Inbound Rules) and leave (Outbound Rules) the instance.

---

Types of Security Group Rules

1. Inbound Rules
Inbound rules control incoming traffic to the EC2 instance.

Example:
SSH (22) → Remote login
HTTP (80) → Website access
HTTPS (443) → Secure website access

2. Outbound Rules
Outbound rules control traffic leaving the EC2 instance.
By default, AWS allows all outbound traffic.

---

Create and configure Security Groups
In ec2-instance:

Choose Create Security Group.

Security Group Name:
web-server-sg

Description:
Security Group for Web Server

---

Configure Inbound Rules
| **Type** | **Protocol** | **Port** | **Source**           | **Purpose**                                      |
| -------- | ------------ | -------- | -------------------- | ------------------------------------------------ |
| SSH      | TCP          | 22       | My IP                | Allows secure remote login to the EC2 instance.  |
| HTTP     | TCP          | 80       | Anywhere (0.0.0.0/0) | Allows users to access the website over HTTP.    |
| HTTPS    | TCP          | 443      | Anywhere (0.0.0.0/0) | Allows secure access to the website using HTTPS. |

Configure Outbound Rules

Default Rule:
| **Type**    | **Protocol** | **Port** | **Destination** | **Purpose**                                                                    |
| ----------- | ------------ | -------- | --------------- | ------------------------------------------------------------------------------ |
| All Traffic | All          | All      | 0.0.0.0/0       | Allows the EC2 instance to send traffic to any destination (default AWS rule). |
