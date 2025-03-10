from scapy.all import *

ip = "172.26.32.1"
ports = [53,80]
honeys = [8080,8443]
blocked = []

def analyzePackets(packet):
    global blocked
    if packet.haslayer(IP):
        response = Ether(src=packet[Ether].dst,dst=packet[Ether].src)/\
            IP(src=packet[IP].dst,dst=packet[IP].src)/\
            TCP(sport=packet[TCP].dport,dport=packet[TCP].sport,ack=packet[TCP].seq+1)
        source = packet[IP].src
    else:
        response =Ether(src=packet[Ether].dst,dst=packet[Ether].src)/\
            IPv6(src=packet[IPv6].dst,dst=packet[IPv6].src)/\
            TCP(sport=packet[TCP].dport,dport=packet[TCP].sport,ack=packet[TCP].seq+1)
        source = packet[IPv6].src
    if packet[TCP].flags != "S":
        return
    port = packet[TCP].dport
    if source in blocked:
        if port in ports:
            response[TCP].flags = "RA"
            print("Sending reset")
        elif port in honeys:
            response[TCP].flags = "SA"
        else:
            return
        sendp(response,verbose=False)
    else:
        if port not in ports:
            blocked += [source]
            if port in honeys:
                response[TCP].flags = "SA"
                sendp(response,verbose=False)
f = "dst host "+ip+" and tcp"

sniff(filter=f,prn=analyzePackets)