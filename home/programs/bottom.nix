{ inputs, outputs, lib, config, pkgs, ... }: {
  programs.bottom = {
    enable = true;

    settings = {
      flags = {
        unnormalized_cpu = true;
        color = "nord";
        mem_as_value = true;
        tree = true;
        show_table_scroll_position = true;
        process_command = true;
        network_use_binary_prefix = true;
        network_use_bytes = true;
      };

      row = [
        {
          ratio = 20;
          child = [
            { type = "cpu"; }
          ];
        }
        {
          ratio = 80;
          child = [
            {
              ratio = 25;
              child = [
                { ratio = 50; type = "net"; }
                { ratio = 25; type = "mem"; }
                { ratio = 25; type = "disk"; }
              ];
            }
            { ratio = 75; type = "proc"; default = true; }
          ];
        }
      ];
    };
  };
}
