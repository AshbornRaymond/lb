Experiment 5:- Analyze the Computer Network Design using SWITCH and HUB in GNS3.

Switch Configure:
 
Fig: Switch


1.	Drag &Drop 4 VPCs and Make a connection.
2.	Set ip address for all VPCs.

    

   
Fig: IP address for all PC’s.

3.	Right click on PC4 & give start capture.

 
Fig: - PC4 Start Capture Picture

4. PC1>ping 192.168.1.2
5. PC1>ping 192.168.1.3
6. PC1>ping 192.168.1.4

 

	 
Fig: Wireshark Displaying the request reply through the connected VPCs and Captured PC.







 HUB Configuration:-
 
Fig: Hub
1.	Drag & Drop VPCs 
2.	Add Ethernet Hub and make a connection..
3.	Set IP Address for all the VPCs.  

    

   
Fig: setting IP address for all VPCs.


4.	Right click on PC4 and give Start Capture.

 
Fig: - PC4 Start Capture Picture

5.	Ping all the VPCs  using ping command
6.	PC1>ping 192.168.1.2
7.	PC1>ping 192.168.1.3
8.	PC1>ping 192.168.1.4



Output:-
 


 

Fig: - Wireshark is displaying the request reply through the connected VPCs and Captured PC.












Experiment 6: - Analyze the Router in Computer Network Design using GNS3.

Objectives:
•	To Learn about IP address Assignment for different sub networks
•	To study the functions of ROUTER device
•	To study the functions of SWITCH device

Introduction to Router Configuration
Setting Up of IOS Router: 
Adding IOS Images to GNS3
Before you start creating projects using IOS routers, add at least one IOS image to GNS3 for 
example in Figure 6.1 , c3745 router image has been selected.




 
Fig: IOS routers preferences
Click New to start the wizard and then click the Browse button to locate your image file. 
After selecting your image file, you’ll be asked whether you would like to decompress the IOS
Image.
 
Fig: Deciding whether to decompress the IOS image
It’s a good idea to let GNS3 decompress your image files; otherwise, your routers will have to decompress the images every time a router loads. Decompressing the images ahead of time will make your routers boot much faster. After decompressing your image, click Next, and GNS3 will attempt to recognize the router platform that your IOS belongs to, as shown in Figure



 
Fig: Name and platform screen

GNS3 has determined that my image file belongs to a c3745 router platform and has
automatically named it c3745.
In general, from here, you can just click through all the configuration settings to configure a
basic router model, but the wizard provides opportunities for you to customize router memory and other features during this process. For now, click Next to continue. You should be presented
with the Memory screen, shown in Figure

 
Fig: IOS Memory screen


Your routers should run fine with the default memory setting. When you’re done, click Next, and you will be presented with the Network adapters screen, as shown in Figure. 

 
Fig: Network adapters screen

The default setting configures your router with the same standard options that are provided with a real model of the same Cisco router. If you would like to add more interfaces, use the drop-down menu next to the available slots and choose the desired network modules. The slot options will be limited to actual options that are available in the real version of the Cisco
router. When you’re done, click Next and choose any WIC modules that you would like to install. Then click Next again to display the Idle-PC screen, shown in Figure.

 
Fig: Idle-PC screen


To start with the Lab exercise, create a topology as shown in Figure  Single router:-
 
Fig:- Single Router Configuration
you will get a red light first.
       
  
Fig:- Showing PC’s IP address.
PC1: ping 192.168.2.1
 
Fig: Ping PC1 to PC3.
Router Configuration:-
 
Router Configuration Commands:
R1# config t
R1 (config)#intf0/0
R1 (config)#ip address 192.168.1.254 255.255.255.0
R1 (config)#no shut
R1 (config)#end
R1 (config)#int f1/0
R1 (config)# ip address 192.168.12.254 255.255.255.0
R1 (config)#no shut
R1 (config)#end

Ping PC1 to PC3.

PC1> ping 192.168.2.1
 
Fig:  Data Packets transfer from PC1 to PC3.
Experiment 8:- Analyze the Computer Network Design using Two Router in GNS3.
Double Router Configuration:
 
Fig: - Double Router Configuration
1.	Drag & Drop 4 VPCs and 2 Switch and also add 2 Router make a connection is shown in above figure.
2.	You will get a red light first.
3.	Give Start and yes.
4.	Set Ip Address for all the VPCs.



       
  
Fig:- Showing PC’s IP address.
5.	Right click on Router R1 give console.
Write the below commands
R1#config t
R1 (config)#int f0/0
R1 (config)#ip address 192.168.1.254 255.255.255.0
R1 (config)#no shut
R1 (config)#exit

R1 (config)#int f1/0
R1 (config)#ip address 192.168.5.1 255.255.255.0
R1 (config)#no shut
R1 (config)#exit
6.	Right click on Router R2 give console.
R2#config t
R2 (config)#int f0/0
R2 (config)#ip address 192.168.2.254 255.255.255.0
R2 (config)#no shut
R2 (config)#exit

R2 (config)#int f1/0
R2 (config)#ip address 192.168.5.2 255.255.255.0
R2 (config)#no shut
R2 (config)#exit
7.	After the configuration ping PCs from connected through the one switch to another switch.
PC1>ping 192.168.2.1

 

PC1>ping 192.168.1.2

 

8.	Now give the Route for transferring the data through the 2 switches using below commands.
For Router R1:
R1#ip route 192.168.2.0 255.255.255.0 192.168.5.2
 
For Router R2:
R2#ip route 192.168.1.0 255.255.255.0 192.168.5.1

 

Now ping the VPCs.
PC1>ping 192.168.2.1
 



Experiment 7: -Analyze the Dynamic Host Configuration Protocol (DHCP) using GNS3.
Objectives: -
•	Understand DHCP Service 
•	Analyzing DHCP Packets
•	Understanding significance of Netmask value

DHCP Overview: -

The Dynamic Host Configuration Protocol (DHCP) is based on the Bootstrap Protocol(BOOTP), which provides the framework for passing configuration information to hosts a TCP/IP network. DHCP adds the capability to automatically allocate reusable addresses and configuration options to Internet hosts. DHCP consists of two Components: a protocol for delivering host-specific configuration parameters from a DHCP server to a host and a mechanism for allocating network addresses to hosts. DHCP is built on a client/server model, where designated DHCP server hosts allocate network addresses and deliver configuration parameters to dynamically configured hosts.

Configure two VMs that will be used to test connectivity from end to end and R1 will serve as a DHCP server to distribute IP addresses. The diagram below details the current setup:
 
 
Fig:- Network Topology for DHCP Configuration
1. In order to configure our router as a DHCP server the following commands were used.
Router Configuration:-

R1#config t
R1(config)#int f0/0
R1(config)#ip address 192.168.1.254 255.255.255.0
R1(config)#no shut
R1(config)#exit
R1(config)#ip dhcp pool formation
R1(dhcp-config) #network 192.168.1.0 255.255.255.0
R1(dhcp-config) #default-router 192.168.1.254 
R1(dhcp-config) #dns-server 192.168.1.254
R1(dhcp-config) #class ec2lt
R1(config-dhcp-pool-class) #address range 192.168.1.2 192.168.1.4
R1(config-dhcp-pool-class) #exit
R1(dhcp-config) #exit
R1(dhcp-config) #do wr
 
Fig: - Router Configuration
2. The commands above will turn the interface on and assign an IP address.
3. Turn on the VPCS. In PC1 and PC2 type dhcp.
PC1>ip dhcp
 
Fig:-Showing PC1 IP address.
DDOORA 192.168.1.2 192.168.1.254 

PC2>ip dhcp
 
Fig:-Showing PC2 IP address.
DDOORA 192.168.1.4 192.168.1.254 


Experiment 10: - Analyze the design of VLAN’S using GNS3.
Objectives:
•	To understand Virtual Lan (VLAN) Concepts

We can solve many of the problems associated with layer 2 switching with VLANs. VLANs work like this: Figure  shows all hosts in this very small company connected to one switch, meaning all hosts will receive all frames, which is the default behavior of all switches.

 
Fig: - One switch, one LAN: Before VLANs, there were no separations between hosts.

If we want to separate the host’s data, we could either buy another switch or create virtual 
LANs, as shown in Figure.

 

Fig, One switch, two virtual LANs (logical separation between hosts): Still physically one
switch, but this switch acts as many separate devices. 

In Figure we configured the switch to be two separate LANs, two subnets, two broadcast domains, two VLANs—they all mean the same thing—without buying another switch. We can do this 1,000 times on most Cisco switches, which saves thousands of Rupees and more! There are two different types of ports in a switched environment. Let’s take a look at the first type in Figure 

 
Fig: - Access Ports
Notice there are access ports for each host and an access port between switches—one for each VLAN.
Access ports
An access port belongs to and carries the traffic of only one VLAN. Traffic is both 
received and sent in native formats with no VLAN information (tagging) whatsoever. Anything
arriving on an access port is simply assumed to belong to the VLAN assigned to the port.
Because an access port doesn’t look at the source address, tagged traffic—a frame with added
VLAN information—can be correctly forwarded and received only on trunk ports.

Trunk ports
The term trunk port was inspired by the telephone system trunks, which carry multiple
telephone conversations at a time. So it follows that trunk ports can similarly carry multiple
VLANs at a time as well.
 
Fig:- VLANs can span across multiple switches by using trunk links, which carry traffic
for multiple VLANs.
Frame Tagging
As you now know, you can set up your VLANs to span more than one connected switch.  You can see that going on in Figure 11.4, which depicts hosts from two VLANs spread across Two switches. This flexible, power-packed capability is probably the main advantage to Implementing VLANs and we can do this with up to a thousand VLANs and thousands upon  Thousands of hosts!

 
Fig: - VLANs Configuration
1.Set IP address for all VPCS.

VMPS	IP address of Ethernet interface eth0 
PC1	192.168.1.1/24
PC2	192.168.1.2/24
PC3	192.168.1.3/24
PC4	192.168.1.4/24

    
Fig:- IP address for all the PC’S.
2. After the IP address setting, then the ping the PC’s.
PC1> ping 192.168.1.3
 
Fig: Ping PC1 to PC3

3. Before setting a LAN connection for VPCs we should remove the wired connection.

 
Fig: - deleting all the connections through the VPCS.








SWITCH Configuration: -

PORT	VLAN	
0(PC1)	1-> ADD	
1(PC2)	1-> ADD	
2(PC3)	2-> ADD	
3(PC4)	2->ADD	
	  	 
 Check-> add-> Apply->&ok.




PC1>ping 192.168.1.3
 




















