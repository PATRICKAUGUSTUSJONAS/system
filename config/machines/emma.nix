{ nodes, ... }: {

  imports = [
    ../hardware/mac
  ];

  mine.string-transfer.enable = true;

  mine.profiles.desktop.enable = true;

  mine.eth.sem6.enable = true;

  mine.dev.rust.enable = true;

  hardware.opengl.enable = true;

  mine.server-sync = {
    enable = true;
    dataDir = "server/data";
    uploadDir = "server/upload";
    server = "infinisil.com";
  };

  mine.rpf.client = {
    server = nodes.yuri;
    webport = 8021;
    sshport = 2021;
    subdomain = "mac";
  };

  nix.nixPath = [
    "nixpkgs=/cfg/external/nixpkgs"
    "emacs=/cfg/config/emacs"
  ];

  #services.openvpn.servers.server = {
  #  up = ''
  #    ip route append 10.149.76.2 metric 50 protocol static src 192.168.1.19 \
  #      nexthop dev enp11s0 || true
  #    ip route append 10.149.76.2 metric 100 protocol static src 192.168.1.30 \
  #      nexthop dev wlp2s0 || true
  #  '';
  #  down = ''
  #    ip route del 10.149.76.2 || true
  #    ip route del 10.149.76.2 || true
  #  '';
  #};

  networking = {
    hostName = "emma";
    hostId = "34cc680d";
    firewall.allowedTCPPorts = [ 1500 1501 ];
  };
}
