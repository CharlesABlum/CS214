import select
from socket import *
import sys
import argparse


parser = argparse.ArgumentParser(description="A prattle client")

parser.add_argument("-n", "--name", dest="name", help="name to be prepended in messages (default: machine name)")
parser.add_argument("-s", "--server", dest="server", default="127.0.0.1",
                    help="server hostname or IP address (default: 127.0.0.1)")
parser.add_argument("-p", "--port", dest="port", type=int, default=12345,
                    help="TCP port the server is listening on (default 12345)")
parser.add_argument("-v", "--verbose", action="store_true", dest="verbose",
                    help="turn verbose output on")
args = parser.parse_args()

    
s = socket(AF_INET, SOCK_STREAM)
s.setsockopt(SOL_SOCKET, SO_REUSEADDR, 1)

if args.name == None:
    args.name = gethostname()
    print "FYI: to the world you will be henceforth known as '" + args.name + "'"

s.connect((args.server, args.port))
# s.sendall('Hello world from ' + args.name)


while True:
    r, w, x = select.select([sys.stdin, s], [], [])
    if r:
        if r[0] == sys.stdin:
            if args.verbose:
                print "***** Got from stdin *****"
            msg = r[0].readline().strip()
            if msg == "END":
                s.close()
                break
            msg = args.name + " says: " + msg
            if args.verbose:
                print "Sending this to socket: -->" + msg + "<--"
            s.sendall(msg)
        else:
            # got from over the network
            if args.verbose:
                print "***** Got from network!! *****"
            msg = r[0].recv(4096)
            if not msg:
                print "Server closed!  Bye, bye!"
                break
            # Put the message on the screen.
            print msg
            sys.stdout.flush()
        
    

