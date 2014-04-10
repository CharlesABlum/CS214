#Written by:    Charles Blum
#Class:         cs332
#Date:          02 April 2014
#Purpose:       This program is a chat program
#               that uses UDP instead of TCP
#               to carry messages aross a LAN

#import socket
from socket import *
import select
import argparse

parser = argparse.ArgumentParser(description="A prattle server using UDP")

parser.add_argument("-p", "--port", dest="port", type=int, default=12345,
        help="UDP port to send and receive on (default 12345)")
parser.add_argument("-d", "--domain", dest="domain", default="153.106.255.255",
        help="the broadcast address of the network (default 153.106.255.255)")
parser.add_argument("-v", "--verbose", action="store_true", dest="verbose",
        help="turn verbose output on")
args = parser.parse_args()

#create a UDP socket
UDPSocket = socket(AF_INET, SOCK_DGRAM)
UDPSocket.bind( ( '<broadcast>', args.port) )

BCAST = "153.106.255.255"

#.sendTo(string, address) where address is the destination being sent
#since this is a UDP Braodcast program send to the bcsat address
#bcast at calvin: 153.106.255.255

#255.255.255.255


#Run until Crtl^c
while True:
    
    message, address = UDPSocket.recvfrom(1024)
    print "message received: ", message
