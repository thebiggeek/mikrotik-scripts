:local topdomain;
:set topdomain "lan.local";
#set the topdomain lan.local to the domain you are using in /ip dhcp-server network 
#this script does not work when you have multiple DHCP Pools - it only works in a Single Pool

# Use ttl to distinguish dynamic added DNS records
:local ttl;
:set ttl "00:59:59";

# Set variables to use
:local hostname;
:local hostip;
:local free;

# Remove all dynamic records
/ip dns static;
:foreach a in=[find] do={
  :if ([get $a ttl] = $ttl) do={
    :put ("Removing: " . [get $a name] . " : " . [get $a address]);
    remove $a;
  }
}

/ip dhcp-server lease ;
:foreach i in=[find] do={
  /ip dhcp-server lease ;
  :if ([:len [get $i host-name]] > 0) do={
    :set free "true";
    :set hostname ([get $i host-name] . "." . $topdomain);
    :set hostip [get $i address];
    /ip dns static ;
# Check if entry already exist
    :foreach di in [find] do={
      :if ([get $di name] = $hostname) do={
        :set free "false";
        :put ("Not adding already existing entry: " . $hostname);
      }
    }
    :if ($free = true) do={
      :put ("Adding: " . $hostname . " : " . $hostip ) ;
      /ip dns static add name=$hostname address=$hostip ttl=$ttl;
    }
  }
}