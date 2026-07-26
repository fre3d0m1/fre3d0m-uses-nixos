{ pkgs, host, ... }:
{
    networking = {
        hostName = "fre3d0m-uses-nixos";
        networkmanager.enable = true;
    };

    boot.kernel.sysctl = {
      "net.core.default_qdisc" = "fq";
      "net.ipv4.tcp_congestion_control" = "bbr";
      "net.ipv4.tcp_fin_timeout" = 15;
      "net.ipv4.tcp_slow_start_after_idle" = 0;
      "net.ipv4.tcp_window_scaling" = 1;
    };
}
