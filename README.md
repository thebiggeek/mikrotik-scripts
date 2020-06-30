# Mikrotik / Router OS Scripts

These are a collection of Scripts I have written / adopted to manage my work with Mirkrotik a little easier

## DHCP to DNS Records
In a lot of our deployments we use either [Pi-Hole](https://pi-hole.net), [Unbound](https://nlnetlabs.nl/projects/unbound/about/) or the Mikrotik Router itself as a DNS Server, in cases where Mikrotik is both DNS and DHCP and you need to ping / reach machine names by their hostname, this script is designed to be run every few minutes, and takes all the DHCP Leases and pushes them to DNS. This script currently is limited to just one IP Pool and the defintion is pre-defined of what the LAN domain is. 

My Next steps in the script are to
[a] pick up the lan domain name
[b] adopt the script to run where there are multiple dhcp pools / networks on the same mikrotik
