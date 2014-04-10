#Written by:    Charles Blum
#Class:         cs332
#Date:          21 March 2014
#Purpose:       This is the server side of a basic TCP
#               chat program.  It opens a socket from 
#               when requested by a client and handles
#               the messages sent by several clients.
#               At the moment can handle up to 5 clients
#               at a time.

#import socket
from socket import *
import select
import argparse

parser = argparse.ArgumentParser(description="A prattle server")

parser.add_argument("-p", "--port", dest="port", type=int, default=12345,
                    help="TCP port the server is listening on (default 12345)")
parser.add_argument("-v", "--verbose", action="store_true", dest="verbose",
                    help="turn verbose output on")
args = parser.parse_args()

#create the server socket to listen on for new connections
server = socket(AF_INET, SOCK_STREAM)
server.setsockopt(SOL_SOCKET, SO_REUSEADDR, 1)
#This could throw an error, use a try/except
try:
    server.bind( ( '127.0.0.1', args.port) )
    server.listen(5)
except socket.error, msg:
    sysout.write( "Error connecting to socket! Please try again.\n" )
    sysout.write( "%s\n" % msg[1] )
    
#create a list to hold all sockets for all clients, and the server listener
socks = [ server ]
if args.verbose:
    print "--- Server is Running... ---"

#Run the server until Crtl^c
while True:
    received, written, exceptions = select.select( socks , [], [])
    for item in received:
        if item == server:
            #create a new connection by accepting the server socket,
            #adapted from the python docs site
            try:
                newSock, addr = server.accept()
                socks.append(newSock)
                newSock.sendall("Welcome to the conversation!  Thank you for connecting.\n")
                if args.verbose:
                    print "--- New Client attempting to connect... ---"
                    print "--- " + str( addr ) + " connected ---"
            except socket.error, msg:
                if args.verbose:
                    sysout.write( "Error connecting new client!\n" )
                    sysout.write( "%s\n" % msg[1] )
        else:   #The socket is already connected
            try:
                message = item.recv(1024)
            except socket.error, msg:
                sysout.write( "Error receivng message from client!\n" )
                sysout.write( "%s\n" % msg[1] )
            if args.verbose:
                print "--- Getting a message from a client... ---"
            if not message: #if the message isn't valid
                if args.verbose:
                    print "Client disconnected."
                socks.remove( item )
            else:
                for client in socks:
                    #If the client is not the one that sent the message
                    #and is not the server, send them the message
                    if client != item and client != server:    
                        client.sendall( message )               