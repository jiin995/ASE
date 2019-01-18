#Autore: Gabriele Previtera
#   Data : 18/01/2018
#   ToDO : Sistemare la formattazione del msg ricevuto, a volte va a capo quando non dovrebbe
# 
#  
#Descrizione: semplice terminale seriale, che legge una stringa e la invia su una seriale
#non implementa nessun controllo di flusso e non aggiunge caratteri alla fine della stringa in input

import serial
import argparse
import sys
import select
import re
from  my_utils import *

if __name__ == "__main__":

    #Parsing dell'input
    parser = argparse.ArgumentParser(description='Simple terminal .')
    parser.add_argument('port', metavar='port',help='serial port ')
    parser.add_argument('boundrate', metavar='boundrate', type=int,help='boundrate ')

    args = parser.parse_args()

    #Stampo gli input 
    terminal_print(args.port)
    terminal_print(args.boundrate)

    #istanzazione dell'oggetto seriale
    #Timeout=0 render la read non bloccante
    ser=serial.Serial(args.port,args.boundrate,timeout=0)
    try:
        while (True):
            #leggo la riga di input dalla serial
            r_line=ser.readline()
            if(len(r_line)>0):
                #elimino eventuali caratteri speciali come line feed cr
                clear_line=re.sub('[^A-Za-z0-9]+=', '',r_line)
                clear_line.rstrip()
                #l1 = [] 
                #l2 = []
                #for c in clear_line:   # in Python, a string is just a sequence, so we can iterate over it!
                #    l1.append(c) 
                #    l2.append(ord(c))
                #print(l1)
                #print(l2)
                print(r_line)

            #Aspetto che in input al terminale ci sia una nuova stringa da leggere e inviare sulla seriale
            while sys.stdin in select.select([sys.stdin], [], [], 0)[0]:
                line = sys.stdin.readline()
                if line:
                    #elimino eventuali caratteri speciali come line feed cr
                    clear_line=re.sub('[^A-Za-z0-9]+', '', line)
                    ser.write(clear_line.encode())
            
    except(KeyboardInterrupt):
        ser.close()
        terminal_print("Fine")
    pass