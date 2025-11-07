# Answer Key for the CTF Challenge

## PCAP 

```bash
strings /opt/ctf2/pcap/suspicious.pcap | grep CTF
```
OR
```bash
tshark -r capture.pcap -Y 'frame contains "CTF"' -V -x
```
