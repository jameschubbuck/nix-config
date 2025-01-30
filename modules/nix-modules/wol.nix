# Enable Wake on Lan (WoL) to wake the PC from a powered off state
{ ... }: -{
    networking.interfaces."enp12s0".wakeOnLan.enable = true;
}
