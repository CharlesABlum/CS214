import select
#from socket import *
import socket
import sys
import argparse


parser = argparse.ArgumentParser(description="A prattle client")

parser.add_argument("-n", "--name", dest="name", 
            help="name to be prepended in messages (default: machine name)")
parser.add_argument("-s", "--server", dest="server", default="127.0.0.1",
            help="server hostname or IP address (default: 127.0.0.1)")
parser.add_argument("-p", "--port", dest="port", type=int, default=12345,
            help="TCP port the server is listening on (default 12345)")
parser.add_argument("-v", "--verbose", action="store_true", dest="verbose",
            help="turn verbose output on")
args = parser.parse_args()

# The values received on the command line are accessible by referencing
# args.name or args.verbose, etc.

#testing parse args
#print args.name
#print args.server
#print args.port
#print args.verbose

#Code to create a socket taken from 
#http://pymotw.com/2/select/

#create a TCP/IP socket to connect to the server
server = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
server_address = (args.server, args.port)
server.connect( server_address )

if args.verbose:
    print "successfully created connection to %s on port %s" % server_address

#list for select.select()
inputs = [ sys.stdin, server ]
i = []
while True:
    #wait for a socket to be ready to process
    buf, dummy1, dummy2 = select.select( inputs ,[],[])
        
    #for loop and ifs taken from chat example:
    #http://stackoverflow.com/questions/16530563/
    #                                peer-to-peer-simple-python-chat-program
    for i in buf:
        if i == server:
            if args.verbose:
                print "\nRECEIVING MESSAGE FROM SERVER"
            data = server.recv(2048)
            if not data:
                sys.stdout.write("\nDISCONNECTED!")
                sys.exit()
            else:
                sys.stdout.write(data)
                sys.stdout.flush()                   
        elif i == sys.stdin:
            if args.verbose:
                print "\nSENDING MESSAGE TO SERVER"
            line = "<" + str(args.name) + "> says: "
            line += sys.stdin.readline()
            server.send(line)