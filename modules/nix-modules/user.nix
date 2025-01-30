# Create default user "james"
{ ... }: {
  users.users.james = {
    isNormalUser = true;
    extraGroups = ["wheel" "networkmanager"];
  };
}
