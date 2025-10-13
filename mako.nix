{ ... }: {
  services.mako.enable = true;
  services.mako.settings = {
    max-history=10;
    sort="-time";
    default-timeout=5000;
    font="KosefontJP Nerd Font 10";
    background-color="#0B0F10";
    text-color="#C5C8C9";
    border-size=1;
    border-color="#618592";
    border-radius=5;
    width=300;
    height=100;
    margin=10;
    padding=10;
    icons=true;
    max-icon-size=32;
    format=''<b>%s</b>\n%b'';
    on-button-left="invoke-default-action";
    on-button-right="dismiss";
    on-button-middle="none";
    anchor="bottom-right";
    actions=true;
    on-notify = "exec mako-sound";
    "actionable=true" = {
      anchor="bottom-left";
    };
    "mode=do-not-disturb" = {
      invisible=1;
    };
  };
}
