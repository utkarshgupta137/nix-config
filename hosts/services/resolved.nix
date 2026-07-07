_: {
  services.resolved = {
    enable = true;
    settings.Resolve = {
      DNSSEC = "allow-downgrade";
      DNSOverTLS = "opportunistic";
    };
  };

  networking = {
    nameservers = [
      "94.140.14.14#dns.adguard-dns.com"
      "94.140.15.15#dns.adguard-dns.com"
      "2a10:50c0::ad1:ff#dns.adguard-dns.com"
      "2a10:50c0::ad2:ff#dns.adguard-dns.com"
    ];

    networkmanager.dns = "systemd-resolved";
    networkmanager.connectionConfig = {
      "ipv4.ignore-auto-dns" = true;
      "ipv6.ignore-auto-dns" = true;
    };
  };
}
