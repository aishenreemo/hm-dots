{ ... }: {
  programs.wofi.enable = true;
  programs.wofi.settings = {
    mode = "drun";
    show-icons = false;
    dmenu = false;
    fuzzy = true;
    prompt = "Type to search";
    width = "35%";
    height = "60%";
    location = 1;
    x = 20;
    y = 20;
  };
  programs.wofi.style = ''
    window {
      background-color: #0B0F10;
      border: solid 1px #99B9D8;
      border-bottom-right-radius: 1rem;
    }
    
    #input {
      margin: 5px;
      border-radius: 0rem;
      border-bottom-right-radius: 1rem;
      border: 1px solid #C5C8C9;
      background-color: #0B0F10;
      color: #C5C8C9;
    }
    
    #inner-box {
      margin: 5px;
    }
    
    #outer-box {
      margin: 5px;
      background-color: #0B0F10;
    }
    
    #scroll {
      border: none;
      border-right: 1px solid #C5C8C9;
      border-bottom-right-radius: 1rem;
    }
    
    #text {
      margin: 5px;
      color: #C5C8C9;
      font-size: 12pt;
    }
    
    #entry {
      border-top-right-radius: 1rem;
      border-bottom-right-radius: 1rem;
      border: none;
      outline: none;
    }
    
    #entry:selected {
      background-color: #99B9D8;
    }
    
    #text:selected {
      color: #0B0F10;
    }
  '';
}
